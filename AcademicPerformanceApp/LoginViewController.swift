//
//  LoginViewController.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/18/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Otuletss
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        configureView()
    }
    
    func configureView() {
        loginButton.layer.cornerRadius = MAIN_CORNER_RADIUS
        setShadow(for: loginButton)
        
        setBorder(for: loginTextField)
        loginTextField.setPaddingWithImage(imageName: "loginIcon")
        setShadow(for: loginButton)
        
        setBorder(for: passwordTextField)
        passwordTextField.setPaddingWithImage(imageName: "passwordIcon")
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
    
}
