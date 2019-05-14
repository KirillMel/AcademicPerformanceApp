//
//  Lecture.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/29/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation
import FirebaseDatabase
import CoreData

struct Lecture: Firebaseable {
    var id: String?
    var subject: String?
    var description: String?
    
    init(id: String, subject: String, description: String) {
        self.id = id
        self.subject = subject
        self.description = description
    }
    
    init?(snapshot: DataSnapshot) {
        let value = snapshot.value as! Dictionary<String, Any>
        self.id = value["id"] as? String
        self.subject = value["subject"] as? String
        self.description = value["description"] as? String
    }
}

@objc(LectureCD)
public class LectureCD: NSManagedObject {
    @NSManaged var id: String?
    @NSManaged var subject: String?
    @NSManaged var name: String?
}

extension LectureCD {
    class func initOrFind(by object: Lecture)  throws -> LectureCD {
        let context = AppDelegate.viewContext
        let request: NSFetchRequest<LectureCD> = LectureCD.fetchRequest() as! NSFetchRequest<LectureCD>
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
        
        let newItem = LectureCD(context: context)
        newItem.map(object)
        
        return newItem
    }
    
    func map(_ object: Lecture) {
        self.id = object.id
        self.subject = object.subject
        self.name = object.description
    }
}

