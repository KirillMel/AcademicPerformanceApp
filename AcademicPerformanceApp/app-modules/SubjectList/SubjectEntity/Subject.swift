//
//  Subject.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/29/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Subject: Firebaseable {
    var id: String?
    var name: String?
    var teacher: String?
    var description: String?
    
    init(id: String?, name: String, teacher: String, description: String) {
        self.id = id
        self.name = name
        self.teacher = teacher
        self.description = description
    }
    
    init?(snapshot: DataSnapshot) {
        let value = snapshot.value as! Dictionary<String, Any>
        self.id = value["id"] as? String
        self.name = value["name"] as? String
        self.description = value["description"] as? String
        self.teacher = value["teacher"] as? String
    }
}
