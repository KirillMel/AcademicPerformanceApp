//
//  ErrorsExtension.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/21/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case unavailable
    case badConnection
}

enum ValidationError: Error {
    case emptyField
}

extension ValidationError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .emptyField:
            return NSLocalizedString("You have an empty field.", comment: "Empty Field")
        }
    }
}
