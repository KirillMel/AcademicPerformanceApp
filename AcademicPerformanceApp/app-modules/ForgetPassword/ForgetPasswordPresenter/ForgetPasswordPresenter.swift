//
//  ForgetPasswordPresenter.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/28/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class ForgetPasswordPresenter: ForgetPasswordPresenterProtocol {
    var router: ForgetPasswordRouterProtocol!
    var interactor: ForgetPasswordInteractorProtocol!
    weak var viewController: ForgetPasswordViewProtocol!
    
    required init(viewController: ForgetPasswordViewProtocol) {
        self.viewController = viewController
    }
    
    func configureView() {
        
    }
    
    func performResetPassword(for email: String?) {
        
    }
}
