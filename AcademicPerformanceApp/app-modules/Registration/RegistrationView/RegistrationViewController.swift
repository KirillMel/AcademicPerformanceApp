//
//  RegistrationViewController.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/20/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, RegistrationViewProtocol {
    
    let configurator: RegistrationConfiguratorProtocol! = RegistrationConfigurator()
    var presenter: RegistrationPresenterProtocol!
    
    //MARK: - Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var registrationLabel: UILabel!
    
    override func viewDidLoad() {
        configurator.configure(with: self)
        setUpUI()
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
        
        signInLabel.textColor = COLORS_PALETTE.last
        registrationLabel.textColor = COLORS_PALETTE.first
    }
    
    func setShadow(for view:UIView) {
        view.layer.masksToBounds = false
        view.layer.shadowRadius = 6.0
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize.init(width: 5.0, height: 5.0)
        view.layer.shadowOpacity = 1.0
    }
    
    func setBorder(for view: UITextField) {
        view.layer.borderWidth = MAIN_BORDER_WIDTH_FOR_FRAMES
        view.layer.cornerRadius = MAIN_CORNER_RADIUS
        view.layer.borderColor = UIColor.lightGray.cgColor
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
