
//
//  ForgetPasswordInteractor.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/28/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class ForgetPasswordInteractor: ForgetPasswordInteractorProtocol {
    weak var presenter: ForgetPasswordPresenterProtocol!
    
    required init(presenter: ForgetPasswordPresenterProtocol) {
        self.presenter = presenter
    }
    
    func resetPassword(for email: String) {
        
    }
}
