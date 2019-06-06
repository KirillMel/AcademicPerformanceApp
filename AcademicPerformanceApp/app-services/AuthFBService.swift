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
                return
            }
            
            self.ref.child("users").child((user?.user.uid)!).observeSingleEvent(of: .value, with: { (snapshot) in
                let currentUser = User(snapshot: snapshot)
                currentUser?.email = user?.user.email
                currentUser?.id = user?.user.uid
                
                self.saveLocal(currentUser!)
                
            }) { (error) in
                print(error.localizedDescription)
            }
            
            completion(nil)
        }
    }
    
    func createUser(_ email: String, _ password: String, _ name: String, _ phoneNumber: String,completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authresult, error in
            if let error = error {
                completion(error)
                return
            }
            
            let id = (authresult?.user.uid)!
            
            let value = ["group": "ti-51", "isteacher": false, "name": name, "phone" : phoneNumber, "mail" : email] as [String : Any]
            
            self.ref.child("users").child(id).setValue(value)
            
            let currentUser = User()
            currentUser.email = email
            currentUser.group = "ti-51"
            currentUser.isTeacher = false
            currentUser.name = name
            currentUser.id = id
            
            self.saveLocal(currentUser)
            
            completion(nil)
        }
    }
    
    private func saveLocal(_ user: User) {
        //створення об'єкта, який буде кодувати дані користувача
        let encoder = JSONEncoder()
        //кодування
        if let encoded = try? encoder.encode(user) {
            let defaults = UserDefaults.standard
            //додавання закодованих даних до UserDefaults за ключем
            defaults.set(encoded, forKey: "currentUser")
        }
    }
}

//розширення UserDefaults для швидкого запита користувача
extension UserDefaults {
    func getUser() -> User? {
        let defaults = UserDefaults.standard
        //запит до UserDefaults за ключем
        if let savedUser = defaults.object(forKey: "currentUser") as? Data {
            //створення декодуючого об'єкта
            let decoder = JSONDecoder()
            //декодування
            if let loadedUser = try? decoder.decode(User.self, from: savedUser) {
                return loadedUser
            }
        }
        //якщо не вийшло декодувати об'єкт, то повертаємо nil
        return nil
    }
}
