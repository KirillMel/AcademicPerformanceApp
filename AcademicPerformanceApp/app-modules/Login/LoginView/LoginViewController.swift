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
    
    weak var parentController: UIViewController?
    
    //MARK: - Otuletss
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgetPasswordLabel: UILabel!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        configurator.configure(with: self)
        setUpUI()
    }
    
    override func viewDidAppear(_ animated: Bool){
        loginButton.isHidden = false
        loginTextField.isHidden = false
        passwordTextField.isHidden = false
    }
    
    //MARK: - UI setups
    func setUpUI() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(forgetPasswordClicked(_:)))
        forgetPasswordLabel.isUserInteractionEnabled = true
        forgetPasswordLabel.addGestureRecognizer(gesture)
        
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
    
    @objc func forgetPasswordClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "segueToForgetPasswordView", sender: parentController)
        UIView.animate(withDuration: 0.15, delay: 0.1, options: .curveEaseOut,
                       animations: {
                        self.loginButton.alpha = 0
                        self.loginTextField.alpha = 0
                        self.passwordTextField.alpha = 0
                        self.forgetPasswordLabel.alpha = 0
        },
                       completion: { _ in self.loginButton.isHidden = true
                        self.loginTextField.isHidden = true
                        self.passwordTextField.isHidden = true
                        self.forgetPasswordLabel.isHidden = true
        })
        parentController?.viewWillDisappear(true)
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        performLogin(username: loginTextField.text, password: passwordTextField.text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueToForgetPasswordView") {
            (segue.destination as! ForgetPasswordViewController).someShit = parentController
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.15, delay: 0.1, options: .curveLinear,
                       animations: {
                        self.loginButton.alpha = 1
                        self.loginTextField.alpha = 1
                        self.passwordTextField.alpha = 1
                        self.forgetPasswordLabel.alpha = 1
        },
                       completion: { _ in self.loginButton.isHidden = false
                        self.loginTextField.isHidden = false
                        self.passwordTextField.isHidden = false
                        self.forgetPasswordLabel.isHidden = false
        })
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
