//
//  Answer.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/29/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class Answer {
    var id: Int?
    var text: String?
    var likedBy: [Int]?
    var postedBy: Int?
    
    init(id: Int, text: String, likedBy: [Int]?, postedBy: Int) {
        self.id = id
        self.text = text
        self.likedBy = likedBy
        self.postedBy = postedBy
    }
}
