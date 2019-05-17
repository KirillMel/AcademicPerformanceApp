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
        //формування запиту до бази даних
        let request: NSFetchRequest<SubjectCD> = SubjectCD.fetchRequest() as! NSFetchRequest<SubjectCD>
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        let sources = try? context.fetch(request)
        var result: [Subject] = [Subject]()
        
        for item in sources! {
            //конвертація об'єкта та додавання до массиву
            result.append(Subject(object: item))
        }
        return result
    }
    
    func saveData(_ itemSource: [Subject]) -> Void {
        for item in itemSource {
            //створення нового або оновлення даних вже існуючого об'єкта
            let _ = try? SubjectCD.initOrFind(by: item)
            //збереження контексту
            try? context.save()
        }
    }
}
