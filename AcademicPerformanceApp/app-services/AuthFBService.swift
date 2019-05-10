//
//  AuthFBService.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 5/8/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class AuthorizationService {
     var ref: DatabaseReference! =  Database.database().reference()
    
    func perform(_ email: String, _ password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if let error = error, user == nil {
                completion(error)
            }
            
            self.ref.child("users").child(user?.user.uid ?? "gX5RfCVEBhfvcbb36zVe6qLHZcf1").observeSingleEvent(of: .value, with: { (snapshot) in
                let value = snapshot.value as! Dictionary<String,Any>
                let name = value["name"] as! String
                let isTeacher = value["isTeacher"] as! Bool
                let group = value["group"] as! String
                
                let currentUser = User()
                currentUser.email = user?.user.email
                currentUser.id = user?.user.uid
                currentUser.name = name
                currentUser.isTeacher = isTeacher
                currentUser.group = group
                
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(currentUser) {
                    let defaults = UserDefaults.standard
                    defaults.set(encoded, forKey: "currentUser")
                }
                
            }) { (error) in
                print(error.localizedDescription)
            }
            
            completion(nil)
        }
    }
}

extension UserDefaults {
    func getUser() -> User? {
        let defaults = UserDefaults.standard
        if let savedUser = defaults.object(forKey: "currentUser") as? Data {
            let decoder = JSONDecoder()
            if let loadedUser = try? decoder.decode(User.self, from: savedUser) {
                return loadedUser
            }
        }
        return nil
    }
}
