//
//  LoginRouter.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/20/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class LoginRouter: LoginRouterProtocol {
    
    weak var viewController: ViperModuleTransitionHandler!
    
    init(viewController: ViperModuleTransitionHandler) {
        self.viewController = viewController
    }
    
    //MARK: - Protocol's implementation
    
    func moveToForgotPasswordPage(del: OutsideNotifierProtocol) {
        viewController.openModule(segueIdentifier: "segueToForgetPasswordView"){input in
            guard let input = input as? ForgetPasswordModuleInput else {
                return
            }
            input.configure(with: del)
            return
        }
    }
    
    func moveInsideApp() {
        
    }
}
