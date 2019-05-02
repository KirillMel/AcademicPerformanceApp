//
//  Lecture.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/29/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class Lecture {
    var id: Int?
    var subject: Int?
    var description: String?
    var questions: [Int]?
    
    init(id: Int, subject: Int, description: String, questions: [Int]?) {
        self.id = id
        self.subject = subject
        self.description = description
        self.questions = questions
    }
}
