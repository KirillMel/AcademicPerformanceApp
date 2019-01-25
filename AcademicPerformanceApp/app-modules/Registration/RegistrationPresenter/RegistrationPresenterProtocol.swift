//
//  RegistrationPresenterProtocol.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/24/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol RegistrationPresenterProtocol: class {
    var viewController: RegistrationViewProtocol! {get set}
    var interactor: RegistrationInteractorProtocol! {get set}
    var router: RegistrationRouterProtocol! {get set}
    
    func configureView() -> Void
    //View to presenter, presenter to interactor
    func performRegistration(username: String?, email: String?, password: String?) -> Void
    //interactor to presenter, presenter to view
    func registrationDidComplete() -> Void
    
    func registrationDidFail(with error: Error) -> Void
}
