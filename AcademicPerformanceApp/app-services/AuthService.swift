//
//  AuthorizationService.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/21/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol AuthServiceProtocol: class {
    var serverService: ServerServiceProtocol!{get}
    
    var  error: Error? {get}
    var user: User? {get}
    
    func loginWithAPICall(route: String, username: String, password: String) -> Bool
}

class RemoteAuthService: AuthServiceProtocol {
    var serverService: ServerServiceProtocol! = ServerService()
    
    var user: User?
    var error: Error?
    
    func loginWithAPICall(route: String, username: String, password: String) -> Bool {
        
        let group = DispatchGroup()
        group.enter()
        DispatchQueue.global(qos: .default).async {
            self.serverService.connectToAPI(with: self.serverService.prepareURLRequest(with: route, method: RequestMethod.get, body: nil)){ (output)  in
                //print(String(data: output, encoding: .utf8))
                self.parseResult(for: output)
                group.leave()
            }
        }
    
        group.wait()
        return false
    }
    
    private func parseResult(for data: Data) {
        self.error = NetworkError.badConnection
        //TODO: - Implement this method wen api was ready
        print("parse procces")
    }
}
