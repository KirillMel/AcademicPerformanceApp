//
//  LectureListRouter.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 5/2/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class LectureListRouter: LectureListRouterProtocol {
    weak var viewController: ViperModuleTransitionHandler!
    
    required init(viewController: ViperModuleTransitionHandler) {
        self.viewController = viewController
    }
    
    func segueToQuestions() {
//        viewController.openModule(segueIdentifier: "segueToQuestions") { item in
//            
//        }
    }
}
