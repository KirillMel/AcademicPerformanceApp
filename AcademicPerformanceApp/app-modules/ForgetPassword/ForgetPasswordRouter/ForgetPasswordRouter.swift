//
//  ForgetPasswordRouter.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/28/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class ForgetPasswordRouter: ForgetPasswordRouterProtocol {
    
    weak var viewController: ForgetPasswordViewProtocol!
    
    required init(viewController: ForgetPasswordViewProtocol) {
        self.viewController = viewController
    }
    
    func moveToPreviousScene() {
        
    }
}
