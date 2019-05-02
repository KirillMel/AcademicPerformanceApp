//
//  SubjectListView.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/28/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol SubjectListViewProtocol: class {
    func reloadData() -> Void
    func displayAlert(title: String, message: String) -> Void
}
