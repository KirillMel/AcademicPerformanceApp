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

class ItemLoaderService<T> where T: Firebaseable {
    //посиланя на базу даних
    var ref = Database.database().reference()
    
    func loadItems(folderName: String, complition: @escaping ([T]?) -> Void){
        //група користувача
        let group = UserDefaults.standard.getUser()?.group ?? "ti-51"
         //завантаження данних з FireBaseDatabase
        self.ref.child("groups").child(group).child(folderName).observeSingleEvent(of: .value, with: { snapshot in
            //масив результатів
            var result = [T]()
            
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    //конвертація в об'єкти
                    let item = T.init(snapshot: snapshot) {
                    result.append(item)
                }
            }
            complition(result) //виклик функції завершення
        }) { error in
            complition(nil) //виклик функції заверення
        }
    }
}
