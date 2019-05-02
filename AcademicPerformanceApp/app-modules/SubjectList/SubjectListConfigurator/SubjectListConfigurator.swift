//
//  SubjectListConfigurator.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/28/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class SubjectListConfigurator: SubjectListConfiguratorProtocol {
    func configure(with view: SubjectListViewProtocol) {
        let viewController = view as! SubjectListViewController
        let presenter = SubjectListPresenter(viewController: viewController)
        let interactor = SubjectListInteractor(presenter: presenter)
        let router = SubjectListRouter(viewController: viewController)
        
        presenter.interactor = interactor
        presenter.router = router
        viewController.presenter = presenter
    }
}
