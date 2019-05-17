//
//  ForgetPasswordConfigurator.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/28/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class ForgetPasswordConfigurator: ForgetPasswordConfiguratorProtocol {
    func configure(with viewController: ForgetPasswordViewProtocol) {
        let unwrapVC = viewController as! ForgetPasswordViewController
        let presenter: ForgetPasswordPresenterProtocol = ForgetPasswordPresenter(viewController: unwrapVC)
        let router: ForgetPasswordRouterProtocol = ForgetPasswordRouter(viewController: unwrapVC)
        let interactor: ForgetPasswordInteractorProtocol = ForgetPasswordInteractor(presenter: presenter)
        
        presenter.router = router
        presenter.interactor = interactor
        unwrapVC.presenter = presenter
    }
}
