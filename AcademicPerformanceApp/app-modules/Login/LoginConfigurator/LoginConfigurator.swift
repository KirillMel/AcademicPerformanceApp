//
//  LoginConfigurator.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/20/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class LoginConfigurator: LoginConfiguratorProtocol {
    func configure(with viewController: LoginViewProtocol) {
        let viewControllerUnwrap = viewController as? LoginViewController
        let presenter = LoginPresenter(viewController: viewControllerUnwrap!)
        let interactor = LoginInteractor(presenter: presenter)
        let router = LoginRouter(viewController: viewControllerUnwrap!)
        
        viewControllerUnwrap?.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
