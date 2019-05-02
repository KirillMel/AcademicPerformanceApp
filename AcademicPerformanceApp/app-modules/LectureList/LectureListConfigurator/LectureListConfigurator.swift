//
//  LectureListConfigurator.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 5/2/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class LectureListConfigurator: LectureListConfiguratorProtocol {
    func configure(with view: LectureListViewProtocol) {
        let viewController = view as! LectureListViewController
        let presenter = LectureListPresenter(viewController: viewController)
        let interactor = LectureListInteractor(presenter: presenter)
        let router = LectureListRouter(viewController: viewController)
        
        presenter.interactor = interactor
        presenter.router = router
        viewController.presenter = presenter
    }
}
