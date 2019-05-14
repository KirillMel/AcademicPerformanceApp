//
//  SubjectListInteractor.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/28/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation
import CoreData

class SubjectListInteractor: SubjectListInteractorProtocol {
    let context = AppDelegate.viewContext
    //MARK: - viper layers
    weak var presenter: SubjectListPresenterProtocol!
    //MARK: - protocol impl
    var count: Int {
        get {
            return subjectsList.count
        }
    }
    
    private let loaderService = ItemLoaderService<Subject>()
    var subjectsList: [Subject] = [Subject]()
    
    required init(presenter: SubjectListPresenterProtocol) {
        self.presenter = presenter
    }
    
    func loadData() {
        if Connectivity.isConnectedToInternet() {
            loaderService.loadItems(folderName: "subjects") { [weak self] result in
                self?.subjectsList = result!
                self?.presenter.subjectsLoadDidSuccessful()
                self?.saveData(self!.subjectsList)
            }
        } else {
            self.subjectsList = loadDataFromCD()!
            if self.subjectsList.count == 0 {
                presenter.subjectsLoadDidFail()
            } else {
                 self.presenter.subjectsLoadDidSuccessful()
            }
        }
    }
}

//MARK: - Working with CoreData
extension SubjectListInteractor {
    func loadDataFromCD() -> [Subject]? {
        let request: NSFetchRequest<SubjectCD> = SubjectCD.fetchRequest() as! NSFetchRequest<SubjectCD>
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        let sources = try? context.fetch(request)
        var result: [Subject] = [Subject]()
        
        for item in sources! {
            result.append(Subject(id: item.id, name: item.name!, teacher: item.teacherId!, description: item.descriptionSubject!))
        }
        return result
    }
    
    func saveData(_ itemSource: [Subject]) -> Void {
        for item in itemSource {
            let _ = try? SubjectCD.initOrFind(by: item)
            try? context.save()
        }
    }
}
