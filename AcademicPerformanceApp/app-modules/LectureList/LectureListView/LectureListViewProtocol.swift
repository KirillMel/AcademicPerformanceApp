//
//  LectureListViewProtocol.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 5/2/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol LectureListViewProtocol: class {
    func reloadData() -> Void
    func displayAlert(title: String, message: String) -> Void
}
