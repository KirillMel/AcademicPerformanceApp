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
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var registrationLabel: UILabel!
    
    override func viewDidLoad() {
        configure()
    }
    
    func configure() {
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
}

//For Control UI from uipageViewController
extension RegistrationViewController {
    func animateView(type: Int,value: CGFloat, index: Int) {
        if (signInLabel==nil) { return }
        switch type
        {
            case 0:
                if (MAX_FONT_SIZE>signInLabel.font.pointSize) {
                    signInLabel.font = signInLabel.font.withSize(MIN_FONT_SIZE + value)
                    signInLabel.textColor = COLORS_PALETTE[index]
                }
                if (MIN_FONT_SIZE<registrationLabel.font.pointSize) {
                    registrationLabel.font = registrationLabel.font.withSize(MAX_FONT_SIZE - value)
                    registrationLabel.textColor = COLORS_PALETTE[COLORS_PALETTE.count - index - 1]
                  }
                  break;
            case 1:
                if (MAX_FONT_SIZE>registrationLabel.font.pointSize) {
                    registrationLabel.font = registrationLabel.font.withSize(MIN_FONT_SIZE + value)
                    registrationLabel.textColor = COLORS_PALETTE[index]
                }
                if (MIN_FONT_SIZE<signInLabel.font.pointSize) {
                    signInLabel.font = signInLabel.font.withSize(MAX_FONT_SIZE - value)
                    signInLabel.textColor = COLORS_PALETTE[COLORS_PALETTE.count - index - 1]
                }
                break;
            default:
                break;
        }
    }
}
