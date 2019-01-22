//
//  LoginInteractorProtocol.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/20/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol LoginInteractorProtocol: class {
    //MARK: - refrences for api and validator protocol's services
    func performLogin(username: String, password: String) -> Void
}
