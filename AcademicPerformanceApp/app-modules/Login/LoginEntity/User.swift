//
//  User.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/22/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class User: Codable {
    var id: String?
    var name: String?
    var surname: String?
    var login: String?
    var email: String?
    var isTeacher: Bool?
    var group: String?
}
