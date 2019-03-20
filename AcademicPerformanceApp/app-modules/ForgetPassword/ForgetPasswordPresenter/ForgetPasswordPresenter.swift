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
    weak var delegate: OutsideNotifierProtocol?
    
    required init(viewController: ForgetPasswordViewProtocol) {
        self.viewController = viewController
    }
    
    func configureView() {
        
    }
    
    func performResetPassword(for email: String?) {
        
    }
    
    func closeScene() {
        delegate?.notifyAboutAppearing()
        router.moveToPreviousScene()
    }
}

extension ForgetPasswordPresenter: ForgetPasswordModuleInput{
    func configure(with delegate: OutsideNotifierProtocol) {
        self.delegate = delegate
        print("CONFIGURATED")
    }
}

protocol ForgetPasswordModuleInput: class {
    func configure(with delegate: OutsideNotifierProtocol) -> Void
}
