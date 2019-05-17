//
//  Answer.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/29/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Answer: Firebaseable {
    var id: String?
    var text: String?
    var questionId: String?
    var accepted: Bool?
    
    init(id: String, text: String, questionId: String, accepted: Bool) {
        self.id = id
        self.text = text
        self.questionId = questionId
        self.accepted = accepted
    }
    
    required init?(snapshot: DataSnapshot) {
        let value = snapshot.value as! Dictionary<String, Any>
        self.text = value["text"] as? String
        self.id = value["id"] as? String
        self.questionId = value["questionId"] as? String
        self.accepted = value["accepted"] as? Bool
    }
}
