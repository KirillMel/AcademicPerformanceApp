//
//  RegistrationConfigurator.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/24/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class RegistrationConfigurator: RegistrationConfiguratorProtocol {
    func configure(with viewController: RegistrationViewProtocol) {
        let viewControllerUnwrap = viewController as? RegistrationViewController
        let presenter: RegistrationPresenterProtocol! = RegistrationPresenter(viewController: viewControllerUnwrap!)
        let interactor: RegistrationInteractorProtocol! = RegistrationInteractor(presenter: presenter)
        let router: RegistrationRouterProtocol! = RegistrationRouter(viewController: viewControllerUnwrap!)
        
        viewControllerUnwrap?.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
