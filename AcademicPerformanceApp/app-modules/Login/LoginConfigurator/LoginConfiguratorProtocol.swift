//
//  LoginConfiguratorProtocol.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/20/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol LoginConfiguratorProtocol: class {
    func configure(with viewController: LoginViewProtocol) -> Void
}
