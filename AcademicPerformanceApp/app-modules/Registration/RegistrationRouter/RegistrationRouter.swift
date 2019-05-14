//
//  RegistrationRouter.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/24/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class RegistrationRouter: RegistrationRouterProtocol {
    weak var viewController: ViperModuleTransitionHandler!
    
    init(viewController: ViperModuleTransitionHandler) {
        self.viewController = viewController
    }
    
    func moveInsideApp() {
        viewController.openModule(segueIdentifier: "insideAppSegue") {_ in
            
        }
    }
}
