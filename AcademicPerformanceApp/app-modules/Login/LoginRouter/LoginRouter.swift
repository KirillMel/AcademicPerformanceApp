//
//  LoginRouter.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/20/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class LoginRouter: LoginRouterProtocol {
    
    weak var viewController: LoginViewProtocol!
    
    init(viewController: LoginViewProtocol) {
        self.viewController = viewController
    }
    
    //MARK: - Protocol's implementation
    
    func moveToForgotPasswordPage() {
        
    }
    
    func moveInsideApp() {
        
    }
}
