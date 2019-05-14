//
//  RegistrationViewController.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/20/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, RegistrationViewProtocol, ViperModuleTransitionHandler {
    
    let configurator: RegistrationConfiguratorProtocol! = RegistrationConfigurator()
    var presenter: RegistrationPresenterProtocol!
    
    //MARK: - Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        configurator.configure(with: self)
        setUpUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        emailTextField.text = ""
        passwordTextField.text = ""
        usernameTextField.text = ""
    }
    
    func setUpUI() {
        registerButton.layer.cornerRadius = MAIN_CORNER_RADIUS
        setShadow(for: registerButton)
        
        usernameTextField.setPaddingWithImage(imageName: "loginIcon")
        setBorder(for: usernameTextField)
        setShadow(for: usernameTextField)
        
        emailTextField.setPaddingWithImage(imageName: "emailIcon")
        setBorder(for: emailTextField)
        setShadow(for: emailTextField)
        
        passwordTextField.setPaddingWithImage(imageName: "passwordIcon")
        setBorder(for: passwordTextField)
        setShadow(for: passwordTextField)
    }
    
    
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        performRegistration(username: usernameTextField.text, email: emailTextField.text, password: passwordTextField.text)
    }
    
    func configureView(with username: String, email: String) {
        
    }
    
    func performRegistration(username: String?, email: String?, password: String?) {
        presenter.performRegistration(username: username, email: email, password: password)
    }
    
    func showError(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
