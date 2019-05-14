//
//  LectureListPresenter.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 5/2/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class LectureListPresenter: LectureListPresenterProtocol {
    
    weak var viewController: LectureListViewProtocol!
    var interactor: LectureListInteractorProtocol!
    var router: LectureListRouterProtocol!
    
    required init(viewController: LectureListViewProtocol) {
        self.viewController = viewController
    }
    
    func setUpViewWithData(_ subject: Subject?) {
        guard let subject = subject else {
            interactor.clearData()
            return
        }
        interactor.subject = subject
        interactor.loadData()
    }
    
    func lecturesLoadDidSuccessful() {
        viewController.reloadData()
    }
    
    func lecturesLoadDidFail() {
        viewController.displayAlert(title: "Error.", message: "Fail while loading data.")
    }
    
    func getLecture(byId id: Int) -> Lecture {
        return interactor.lecturesList[id]
    }
    
    func getCount() -> Int {
        return interactor.lecturesList.count
    }
}
