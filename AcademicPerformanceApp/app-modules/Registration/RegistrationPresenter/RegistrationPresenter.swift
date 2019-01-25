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
    
    func performRegistration(username: String?, email: String?, password: String?) {
        guard let username = username, let email = email,let password = password else {
            registrationDidFail(with: ErrorPointer.none as! Error)
            return
         }
        interactor.performRegistration(username: email, email: password, password: password)
    }
    
    func registrationDidComplete(/*user param*/) {
        // set user to user defaults or in db, prepare data for view and segue 
    }
    
    func registrationDidFail(with error: Error) {
        viewController.showError(error: error.localizedDescription)
    }
}
