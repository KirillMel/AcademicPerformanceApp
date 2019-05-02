//
//  LectureListInteractor.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 5/2/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class LectureListInteractor: LectureListInteractorProtocol {
    
    weak var presenter: LectureListPresenterProtocol!
    
    var lecturesList: [Lecture] = [Lecture]()
    
    required init(presenter: LectureListPresenterProtocol) {
        self.presenter = presenter
    }
    
    func loadData() {
        let item1 = Lecture(id: 0, subject: 1, description: "Nice lecture", questions: nil)
        let item2 = Lecture(id: 1, subject: 1, description: "Some fucking shit", questions: nil)
        
        lecturesList.append(item1)
        lecturesList.append(item2)
        
        presenter.lecturesLoadDidSuccessful()
    }
}
