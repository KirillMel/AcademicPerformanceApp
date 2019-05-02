//
//  LectureListInteractorProtocol.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 5/2/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol LectureListInteractorProtocol: class {
    var lecturesList: [Lecture] {get}
    
    func loadData() -> Void
}