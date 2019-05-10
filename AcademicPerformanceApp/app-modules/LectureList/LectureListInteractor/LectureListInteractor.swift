//
//  LectureListInteractor.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 5/2/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation
import FirebaseDatabase

class LectureListInteractor: LectureListInteractorProtocol {
    weak var presenter: LectureListPresenterProtocol!
    
    var lecturesList: [Lecture] = [Lecture]()
     var subject: Subject!
    
     private let loaderService = ItemLoaderService<Lecture>()
    
    //var ref = Database.database().reference()
    
    required init(presenter: LectureListPresenterProtocol) {
        self.presenter = presenter
    }
    
    func loadData() {
//        let item1 = Lecture(id: "0", subject: "1", description: "Nice lecture")
//        let item2 = Lecture(id: "1", subject: "1", description: "Some fucking shit")
//        
//        lecturesList.append(item1)
//        lecturesList.append(item2)
        
        
//                let id = "\(UUID())"
//                let message = ["id" : id ,"subject": subject.id!, "description": "Polymorphism"]
//                self.ref.child("groups").child(CurrentUser.get()!.group!).child("lectures").child(id).setValue(message)
        
        loaderService.loadItems(folderName: "lectures") { [weak self] result in
            for item in result! {
                if item.subject == self?.subject.id {
                    self?.lecturesList.append(item)
                }
            }
            self?.presenter.lecturesLoadDidSuccessful()
        }
    }
}
