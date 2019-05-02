//
//  SubjectListRouter.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/28/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class SubjectListRouter: SubjectListRouterProtocol {
    weak var viewController: ViperModuleTransitionHandler!
    
    required init(viewController: ViperModuleTransitionHandler) {
        self.viewController = viewController
    }
    
    func segueToLectures() {
        
    }
}
