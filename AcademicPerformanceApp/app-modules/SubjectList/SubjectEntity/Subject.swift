//
//  Subject.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/29/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation
import FirebaseDatabase
import CoreData

struct Subject: Firebaseable {
    var id: String?
    var name: String?
    var teacher: String?
    var description: String?
    
    init(id: String?, name: String, teacher: String, description: String) {
        self.id = id
        self.name = name
        self.teacher = teacher
        self.description = description
    }
    
    init?(snapshot: DataSnapshot) {
        let value = snapshot.value as! Dictionary<String, Any>
        self.id = value["id"] as? String
        self.name = value["name"] as? String
        self.description = value["description"] as? String
        self.teacher = value["teacher"] as? String
    }
}

@objc(SubjectCD)
class SubjectCD: NSManagedObject {
    @NSManaged var id: String?
    @NSManaged var descriptionSubject: String?
    @NSManaged var name: String?
    @NSManaged var teacherId: String?
}

extension SubjectCD {
    class func initOrFind(by object: Subject)  throws -> SubjectCD {
        let context = AppDelegate.viewContext
        let request: NSFetchRequest<SubjectCD> = SubjectCD.fetchRequest() as! NSFetchRequest<SubjectCD>
        let predicate = NSPredicate(format: "id = %@", "\(object.id!)")
        
        request.predicate = predicate
        
        do {
            let matches = try context.fetch(request)
            if matches.count > 0 {
                return matches[0]
            }
            
        } catch {
            throw error
        }
        
        let newItem = SubjectCD(context: context)
        newItem.map(object)
        
        return newItem
    }
    
    func map(_ object: Subject) {
        self.id = object.id
        self.descriptionSubject = object.description
        self.name = object.name
        self.teacherId = object.teacher
    }
}
