//
//  ForgetPasswordPresenterProtocol.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/28/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol ForgetPasswordPresenterProtocol: class {
    var router: ForgetPasswordRouterProtocol! { get set }
    var interactor: ForgetPasswordInteractorProtocol! { get set }
    
    func configureView() -> Void
    
    func performResetPassword(for email: String?) -> Void
    
    func closeScene() -> Void
}
