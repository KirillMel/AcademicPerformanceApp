//
//  RegistrationRouter.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/24/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class RegistrationRouter: RegistrationRouterProtocol {
    weak var viewController: RegistrationViewProtocol!
    
    init(viewController: RegistrationViewProtocol) {
        self.viewController = viewController
    }
    
    func moveInsideApp() {
        
    }
}
