//
//  User.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/22/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation
import FirebaseDatabase

class User: Codable, Firebaseable {
    var id: String?
    var name: String?
    var surname: String?
    var login: String?
    var email: String?
    var isTeacher: Bool?
    var group: String?
    var phone: String?
    
    required init?(snapshot: DataSnapshot) {
        let value = snapshot.value as! Dictionary<String,Any>
        self.name = value["name"] as? String
        self.isTeacher = value["isteacher"] as? Bool
        self.group = value["group"] as? String
        self.phone = value["phone"] as? String
        self.email = value["mail"] as? String
    }
    
    init() {
        
    }
}
