//
//  ForgetPasswordViewController.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/25/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController, ForgetPasswordViewProtocol {
    var someShit: UIViewController?
    
    var presenter: ForgetPasswordPresenterProtocol?
    var configurator: ForgetPasswordConfiguratorProtocol = ForgetPasswordConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
    }
    
    @IBAction func goBack(_ sender: Any) {
        someShit?.viewWillAppear(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func configureView() {
        
    }
}
