//
//  Lecture.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/29/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Lecture: Firebaseable {
    var id: String?
    var subject: String?
    var description: String?
    
    init(id: String, subject: String, description: String) {
        self.id = id
        self.subject = subject
        self.description = description
    }
    
    init?(snapshot: DataSnapshot) {
        let value = snapshot.value as! Dictionary<String, Any>
        self.id = value["id"] as? String
        self.subject = value["subject"] as? String
        self.description = value["description"] as? String
    }
}
