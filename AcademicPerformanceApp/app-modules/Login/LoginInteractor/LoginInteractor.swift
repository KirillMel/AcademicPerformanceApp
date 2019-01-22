//
//  LoginInteractor.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/20/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class LoginInteractor: LoginInteractorProtocol {
    weak var presenter: LoginPresenterProtocol!
    private let validationService: ValidationServiceProtocol! = ValidationService()
    private let authorizationService: AuthServiceProtocol! = RemoteAuthService()
    
    init(presenter: LoginPresenterProtocol){
        self.presenter = presenter
    }
    
    func performLogin(username: String, password: String) {
        if (!validationService.validate(for: username)) {
            presenter.loginDidFail(with: validationService.error!)
            return
        }
        if (!validationService.validate(for: password)) {
            presenter.loginDidFail(with: validationService.error!)
            return
        }
        
        if (!authorizationService.loginWithAPICall(route: "https://api.openaq.org/v1/cities", username: "f", password: "f")){
            presenter.loginDidFail(with: authorizationService.error ?? NetworkError.unavailable)
        }
        
    }
}