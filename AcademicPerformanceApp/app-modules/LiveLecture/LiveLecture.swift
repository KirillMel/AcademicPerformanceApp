//
//  LiveLecture.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 5/13/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct LiveEntity: Firebaseable {
    var lectureId: String?
    var lectureName: String?
    
    init?(snapshot: DataSnapshot) {
        let value = snapshot.value as! Dictionary<String, Any>
        self.lectureId = value["lecture"] as? String
        self.lectureName = value["lectureName"] as? String
    }
}
