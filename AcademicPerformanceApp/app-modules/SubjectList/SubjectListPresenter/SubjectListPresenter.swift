//
//  SubjectListPresenter.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/28/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class SubjectListPresenter: SubjectListPresenterProtocol {
    
    weak var viewController: SubjectListViewProtocol!
    var interactor: SubjectListInteractorProtocol!
    var router: SubjectListRouterProtocol!
    
    required init(viewController: SubjectListViewProtocol) {
        self.viewController = viewController
    }
    
    func setUpViewWithData() {
        interactor.loadData()
    }
    
    func subjectsLoadDidSuccessful() {
        viewController.reloadData()
    }
    
    func subjectsLoadDidFail() {
        viewController.displayAlert(title: "Notice.", message: "Fail while loading subjects")
    }
    
    func getSubject(byId id: Int) -> (name: String, teacher: String) {
        let subject = interactor.subjectsList[id]
        return (subject.name ?? "", subject.teacher ?? "")
    }
    
    func getCount() -> Int {
        return interactor.count
    }
    
    
}
