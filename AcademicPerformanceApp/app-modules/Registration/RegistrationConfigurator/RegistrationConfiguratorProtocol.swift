//
//  RegistrationConfiguratorProtocol.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/24/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol RegistrationConfiguratorProtocol: class {
    func configure(with viewController: RegistrationViewProtocol) -> Void
}
