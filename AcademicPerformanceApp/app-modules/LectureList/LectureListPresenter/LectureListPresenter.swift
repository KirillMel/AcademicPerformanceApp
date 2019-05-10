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
    
    func setUpViewWithData(_ subject: Subject) {
        interactor.subject = subject
        interactor.loadData()
    }
    
    func lecturesLoadDidSuccessful() {
        viewController.reloadData()
    }
    
    func lecturesLoadDidFail() {
        
    }
    
    func getLecture(byId id: Int) -> String {
        return interactor.lecturesList[id].description ?? ""
    }
    
    func getCount() -> Int {
        return interactor.lecturesList.count
    }
}
