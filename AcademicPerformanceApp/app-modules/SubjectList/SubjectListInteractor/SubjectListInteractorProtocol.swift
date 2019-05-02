//
//  SubjectListInteractorProtocol.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/28/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol SubjectListInteractorProtocol: class {
    var count: Int {get}
    var subjectsList: [Subject] {get}
    
    func loadData() -> Void
}
