//
//  SubjectListInteractor.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/28/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class SubjectListInteractor: SubjectListInteractorProtocol {
    //MARK: - viper layers
    weak var presenter: SubjectListPresenterProtocol!
    //MARK: - protocol impl
    var count: Int {
        get {
            return subjectsList.count
        }
    }
    
    var subjectsList: [Subject] = [Subject]()
    
    required init(presenter: SubjectListPresenterProtocol) {
        self.presenter = presenter
    }
    
    func loadData() {
        let item1 = Subject(id: 1, name: "economic", teacher: "Teacher 1", description: "strange subject")
        let item2 = Subject(id: 2, name: "information technologies", teacher: "Teacher 2", description: "strange subject")
        let item3 = Subject(id: 3, name: "Logic", teacher: "Teacher 3", description: "very strange subject")
        
        subjectsList.append(item1)
        subjectsList.append(item2)
        subjectsList.append(item3)
        
        presenter.subjectsLoadDidSuccessful()
    }
}
