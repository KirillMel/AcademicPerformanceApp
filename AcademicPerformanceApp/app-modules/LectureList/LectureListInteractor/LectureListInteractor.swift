//
//  LectureListInteractor.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 5/2/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation
import FirebaseDatabase
import CoreData

class LectureListInteractor: LectureListInteractorProtocol {
    let context = AppDelegate.viewContext
    
    weak var presenter: LectureListPresenterProtocol!
    
    var lecturesList: [Lecture] = [Lecture]()
     var subject: Subject!
    
     private let loaderService = ItemLoaderService<Lecture>()
    
    required init(presenter: LectureListPresenterProtocol) {
        self.presenter = presenter
    }
    
    func loadData() {
        if Connectivity.isConnectedToInternet() {
            loaderService.loadItems(folderName: "lectures") { [weak self] result in
                for item in result! {
                    if item.subject == self?.subject.id {
                        self?.lecturesList.append(item)
                    }
                }
                self?.presenter.lecturesLoadDidSuccessful()
                self?.saveData(self!.lecturesList)
            }
        } else {
            let dataFromCD = loadDataFromCD()!
            for item in dataFromCD {
                if item.subject == self.subject.id {
                    self.lecturesList.append(item)
                }
            }
            if self.lecturesList.count == 0 {
                self.presenter.lecturesLoadDidFail()
            } else {
                self.presenter.lecturesLoadDidSuccessful()
            }
        }
    }
    func clearData() {
        lecturesList = [Lecture]()
    }
}

//MARK: - Working with CoreData
extension LectureListInteractor {
    func loadDataFromCD() -> [Lecture]? {
        let request: NSFetchRequest<LectureCD> = LectureCD.fetchRequest() as! NSFetchRequest<LectureCD>
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        let sources = try? context.fetch(request)
        var result: [Lecture] = [Lecture]()
        
        for item in sources! {
            result.append(Lecture(id: item.id!, subject: item.subject!, description: item.name!))
        }
        return result
    }
    
    func saveData(_ itemSource: [Lecture]) -> Void {
        for item in itemSource {
            let _ = try? LectureCD.initOrFind(by: item)
            try? context.save()
        }
    }
}
