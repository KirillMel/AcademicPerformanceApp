//
//  RegistrationViewController.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/20/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        configure()
    }
    
    func configure() {
        registerButton.layer.cornerRadius = MAIN_CORNER_RADIUS
        setShadow(for: registerButton)
        
        usernameTextField.setPaddingWithImage(imageName: "loginIcon")
        setBorder(for: usernameTextField)
        setShadow(for: usernameTextField)
        
        emailTextField.setPaddingWithImage(imageName: "loginIcon")
        setBorder(for: emailTextField)
        setShadow(for: emailTextField)
        
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
}
