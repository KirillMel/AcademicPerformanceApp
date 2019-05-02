//
//  Subject.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/29/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class Subject {
    var id: Int?
    var name: String?
    var teacher: String?
    var description: String?
    
    init(id: Int, name: String, teacher: String, description: String) {
        self.id = id
        self.name = name
        self.teacher = teacher
        self.description = description
    }
}
