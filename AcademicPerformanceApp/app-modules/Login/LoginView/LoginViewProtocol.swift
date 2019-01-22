//
//  LoginViewProtocol.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/20/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol LoginViewProtocol: class {
    func configureView(with username: String) -> Void
    
    func performLogin(username: String?, password: String?) -> Void
    
    func showError(error: String) -> Void
}
