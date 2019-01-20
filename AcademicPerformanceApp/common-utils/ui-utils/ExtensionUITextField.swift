//
//  ExtensionUITextField.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/20/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    //MARK: - Set image with padding inside textField
    func setPaddingWithImage(imageName: String){
        let height = self.frame.size.height
        
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFit
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: height))
        imageView.frame = CGRect(x: 10, y: 8, width: 22.0, height: 22.0)
        
        //For Setting extra padding other than Icon.
        let seperatorView = UIView(frame: CGRect(x: 40, y: 0, width: 5, height: height))
        seperatorView.backgroundColor = UIColor.clear
        view.addSubview(seperatorView)
        self.leftViewMode = .always
        view.addSubview(imageView)
        view.backgroundColor = .clear
        self.leftViewMode = UITextField.ViewMode.always
        self.leftView = view
    }
}
