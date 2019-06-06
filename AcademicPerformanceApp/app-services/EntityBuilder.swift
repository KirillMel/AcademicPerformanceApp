//
//  EntityBuilder.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 5/10/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation
import FirebaseDatabase

class EntityBuilder {
    var ref = Database.database().reference()
    
    func build(folder: String, value: [String: Any], id: String) {
        let group = UserDefaults.standard.getUser()!.group!
    self.ref.child("groups").child(group).child(folder).child(id).setValue(value)
    }
}
