//
//  Question.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 5/10/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Question: Firebaseable {
    var text: String?
    var id: String?
    var lectureId: String?
    
    init(text: String, id: String, lectureId: String) {
        self.text = text
        self.id = id
        self.lectureId = lectureId
    }
    
    required init?(snapshot: DataSnapshot) {
        let value = snapshot.value as! Dictionary<String, Any>
        self.text = value["text"] as? String
        self.id = value["id"] as? String
        self.lectureId = value["lectureId"] as? String
    }
}
