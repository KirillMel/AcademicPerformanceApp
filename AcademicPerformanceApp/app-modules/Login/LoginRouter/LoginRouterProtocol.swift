//
//  LoginRouterProtocol.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/20/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol LoginRouterProtocol: class {
    func moveToForgotPasswordPage(del: OutsideNotifierProtocol) -> Void
    func moveInsideApp() -> Void
}
