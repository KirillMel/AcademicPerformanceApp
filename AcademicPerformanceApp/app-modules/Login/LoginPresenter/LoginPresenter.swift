//
//  LoginPresenter.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/20/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    weak var viewController: LoginViewProtocol!
    var router: LoginRouterProtocol!
    var interactor: LoginInteractorProtocol!
    
    required init(viewController: LoginViewProtocol) {
        self.viewController = viewController
    }
    
    func configureView() {
        viewController.configureView(with: "")
    }
    
    func performLogin(username: String?, password: String?) {
        interactor.performLogin(username: username ?? "", password: password ?? "")
    }
    
    func loginDidComplete() {
        router.moveInsideApp()
    }
    
    func loginDidFail(with error: Error) {
        viewController.showError(error: error.localizedDescription)
    }
    
    func moveToFP() {
        router.moveToForgotPasswordPage(del: self as OutsideNotifierProtocol)
    }
}

extension LoginPresenter: OutsideNotifierProtocol{
    func notifyAboutAppearing() {
        self.configureView()
    }
    
    func notifyAboutDisapearing() {
    }
}
