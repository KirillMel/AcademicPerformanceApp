//
//  ValidationService.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/21/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol ValidationServiceProtocol: class {
    var error: Error? { get }
    
    func validate(for field: String) -> Bool
}

class ValidationService: ValidationServiceProtocol {
    private (set) var error: Error?
    
    func validate(for field: String) -> Bool {
        //fake call of validator
        //error = ValidationError.emptyField
        return true
    }
}
