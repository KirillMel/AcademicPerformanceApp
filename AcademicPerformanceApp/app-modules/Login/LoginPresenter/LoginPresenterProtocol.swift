//
//  LoginPresenterProtocol.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/20/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol LoginPresenterProtocol: class {
    var router: LoginRouterProtocol! { set get }
    
    func configureView() -> Void
    //View to presenter, presenter to interactor
    func performLogin(username: String?, password: String?) -> Void
    //interactor to presenter, presenter to view
    func loginDidComplete() -> Void
    
    func loginDidFail(with error: Error) -> Void
}
