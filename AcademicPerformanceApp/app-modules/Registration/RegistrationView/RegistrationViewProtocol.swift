//
//  RegistrationViewProtocol.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/24/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol RegistrationViewProtocol: class {
    func configureView(with username: String, email: String) -> Void
    
    func performRegistration(username: String?, email: String?, password: String?) -> Void
    
    func showError(error: String) -> Void
}
