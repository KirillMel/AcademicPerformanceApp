//
//  ItemLoader.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 5/8/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation
import FirebaseDatabase

protocol Firebaseable {
    init?(snapshot: DataSnapshot)
}

class ItemLoaderService<T> where T: Firebaseable{
    var ref = Database.database().reference()
    
    func loadItems(folderName: String, complition: @escaping ([T]?) -> Void){
        let group = UserDefaults.standard.getUser()!.group!
        
        self.ref.child("groups").child(group).child(folderName).observeSingleEvent(of: .value, with: { snapshot in
            
            var result = [T]()
            
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let item = T.init(snapshot: snapshot) {
                    result.append(item)
                }
            }
            complition(result)
        }) { error in
            complition(nil)
        }
    }
}
