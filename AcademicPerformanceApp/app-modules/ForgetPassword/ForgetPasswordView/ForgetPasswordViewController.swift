//
//  ForgetPasswordViewController.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/25/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController, ForgetPasswordViewProtocol, ViperModuleTransitionHandler {
    var someShit: UIViewController?
    
    var presenter: ForgetPasswordPresenterProtocol?
    var configurator: ForgetPasswordConfiguratorProtocol = ForgetPasswordConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func CreateModule(){
        configurator.configure(with: self)
    }
    
    @IBAction func goBack(_ sender: Any) {
        presenter?.closeScene()
    }
    
    func configureView() {
        
    }
}
