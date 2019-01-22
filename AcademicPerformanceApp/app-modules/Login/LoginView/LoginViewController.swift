//
//  LoginViewController.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/18/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {
    var presenter: LoginPresenterProtocol!
    let configurator: LoginConfiguratorProtocol = LoginConfigurator()
    
    //MARK: - Otuletss
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        configurator.configure(with: self)
        setUpUI()
    }
    
    //MARK: - UI setups
    func setUpUI() {
        loginButton.layer.cornerRadius = MAIN_CORNER_RADIUS
        setShadow(for: loginButton)
        
        loginTextField.setPaddingWithImage(imageName: "loginIcon")
        setBorder(for: loginTextField)
        setShadow(for: loginTextField)
        
        passwordTextField.setPaddingWithImage(imageName: "passwordIcon")
        setBorder(for: passwordTextField)
        setShadow(for: passwordTextField)
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
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        performLogin(username: loginTextField.text, password: passwordTextField.text)
    }
    
    //MARK: - Implementation of LoginViewProtocol
    func configureView(with username: String){
        loginTextField.text = username
    }
    
    func performLogin(username: String?, password: String?) {
        presenter.performLogin(username: username, password: password)
    }
    
    func showError(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
