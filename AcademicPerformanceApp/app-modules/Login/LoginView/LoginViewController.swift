//
//  LoginViewController.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/18/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewProtocol, ViperModuleTransitionHandler {
    var presenter: LoginPresenterProtocol!
    let configurator: LoginConfiguratorProtocol = LoginConfigurator()
    
    weak var parentController: UIViewController?
    
    //MARK: - Otuletss
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgetPasswordLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    //MARK: - UI setups
    func setUpUI() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(forgetPasswordClicked(_:)))
        forgetPasswordLabel.isUserInteractionEnabled = true
        forgetPasswordLabel.addGestureRecognizer(gesture)
        
        loginButton.layer.cornerRadius = MAIN_CORNER_RADIUS
        setShadow(for: loginButton)
        
        loginTextField.setPaddingWithImage(imageName: "emailIcon")
        setBorder(for: loginTextField)
        setShadow(for: loginTextField)
        
        passwordTextField.setPaddingWithImage(imageName: "passwordIcon")
        setBorder(for: passwordTextField)
        setShadow(for: passwordTextField)
    }
    
    @objc func forgetPasswordClicked(_ sender: Any) {
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        activityIndicator.startAnimating()
        performLogin(username: loginTextField.text, password: passwordTextField.text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        activityIndicator.stopAnimating()
        
        let configurationHolder = segue.destination as? ForgetPasswordViewController
        configurationHolder?.CreateModule()
        (sender as? SegueInfo)?.configurationBlock?(configurationHolder?.presenter)
    }
    
    //MARK: - Implementation of LoginViewProtocol
    func configureView(with username: String){
        //loginTextField.text = username
        
        if (!loginTextField.isHidden) { return }
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut,
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
        
        parentController?.viewWillAppear(true)
    }
    
    func performLogin(username: String?, password: String?) {
        presenter.performLogin(username: username, password: password)
    }
    
    func showError(error: String) {
        activityIndicator.stopAnimating()
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
