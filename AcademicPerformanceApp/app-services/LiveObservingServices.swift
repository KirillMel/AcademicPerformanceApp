//
//  LiveObservingServices.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 5/10/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation
import FirebaseDatabase

class LiveObservingServices {
    private var ref = Database.database().reference()
    
    func loadItems(complition: @escaping ([Question]?) -> Void){
        let group = UserDefaults.standard.getUser()!.group!
        
        self.ref.child("groups").child(group).child("questions").observe(.value, with: { snapshot in
            
            var result = [Question]()
            
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let item = Question.init(snapshot: snapshot) {
                    result.append(item)
                }
            }
            complition(result)
        }) { error in
            complition(nil)
        }
    }
    
    func removeObservers() {
        ref.removeAllObservers()
    }
}

