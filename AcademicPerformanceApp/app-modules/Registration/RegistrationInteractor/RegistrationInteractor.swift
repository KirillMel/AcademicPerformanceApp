//
//  RegistrationInteractor.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/24/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class RegistrationInteractor: RegistrationInteractorProtocol {
    weak var presenter: RegistrationPresenterProtocol!
    var validationService: ValidationServiceProtocol! = ValidationService()
    var authorizationService: AuthServiceProtocol! = RemoteAuthService()
    
    init(presenter: RegistrationPresenterProtocol){
        self.presenter = presenter
    }
    
    //MARK: - RegistrationInteractorProtocol implementation
    func performRegistration(username: String, email: String, password: String) {
        if (!validationService.validate(for: username)) {
            presenter.registrationDidFail(with: validationService.error!)
            return
        }
        if (!validationService.validate(for: password)) {
            presenter.registrationDidFail(with: validationService.error!)
            return
        }
        
        if (!authorizationService.loginWithAPICall(route: "https://api.openaq.org/v1/cities", username: "f", password: "f")){
            presenter.registrationDidFail(with: authorizationService.error ?? NetworkError.unavailable)
        } else {
            presenter.registrationDidComplete()//sent user to a presenter
        }
    }
}
