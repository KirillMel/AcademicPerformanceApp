//
//  ServerService.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/22/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

enum ServerResult {
    case Success
    case Fail
}

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol ServerServiceProtocol {
    func prepareURLRequest(with string: String, method: RequestMethod, body: [String:Any]?) -> URLRequest
    func connectToAPI(with request: URLRequest, completionBlock: @escaping (Data) -> Void) -> Void
}

class ServerService: ServerServiceProtocol {
    
    func connectToAPI(with request: URLRequest, completionBlock: @escaping (Data) -> Void) -> Void {
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else { return }
            completionBlock(data)
        }
        task.resume()
    }
    
    func prepareURLRequest(with string: String, method: RequestMethod, body: [String:Any]?) -> URLRequest {
        let url = URL(string: string)
        
        var request = URLRequest(url: url!)
        request.httpMethod = method.rawValue
        
        guard let body = body else { return request }
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        request.httpBody = jsonData
        
        return request
    }
}
