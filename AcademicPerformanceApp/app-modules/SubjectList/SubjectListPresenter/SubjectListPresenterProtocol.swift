//
//  SubjectListPresenterProtocol.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/28/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol SubjectListPresenterProtocol: class {
    func setUpViewWithData() -> Void
    func subjectsLoadDidSuccessful() -> Void
    func subjectsLoadDidFail() -> Void
    func getSubject(byId id: Int) -> (name: String, teacher: String)
    func getCount() -> Int
}
