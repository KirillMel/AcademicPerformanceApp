//
//  RegistrationInteractorProtocol.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/24/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol RegistrationInteractorProtocol: class {
    func performRegistration(username: String, email:String, password: String, phoneNumber: String) -> Void
}
