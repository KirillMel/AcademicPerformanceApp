//
//  LectureListPresenterProtocol.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 5/2/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol LectureListPresenterProtocol: class {
    func setUpViewWithData() -> Void
    func lecturesLoadDidSuccessful() -> Void
    func lecturesLoadDidFail() -> Void
    func getLecture(byId id: Int) -> String
    func getCount() -> Int
}
