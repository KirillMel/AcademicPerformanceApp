//
//  RegistrationPresenter.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/24/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class RegistrationPresenter: RegistrationPresenterProtocol {
    weak var viewController: RegistrationViewProtocol!
    var interactor: RegistrationInteractorProtocol!
    var router: RegistrationRouterProtocol!
    
    init(viewController: RegistrationViewProtocol){
        self.viewController = viewController
    }
    
    //MARK: - RegistrationPresenterProtocol implementation
    func configureView() {
        
    }
    
    func performRegistration(username: String?, email: String?, password: String?, phoneNumber: String?) {
        guard let username = username,
            let email = email,
            let password = password,
            let phoneNumber = phoneNumber else {
            registrationDidFail(with: ErrorPointer.none as! Error)
            return
         }
        interactor.performRegistration(username: username, email: email, password: password, phoneNumber: phoneNumber)
    }
    
    func registrationDidComplete() {
        router.moveInsideApp()
    }
    
    func registrationDidFail(with error: Error) {
        viewController.showError(error: error.localizedDescription)
    }
}
