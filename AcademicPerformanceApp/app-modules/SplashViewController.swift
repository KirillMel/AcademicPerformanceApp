//
//  SplashViewController.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 5/7/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class SlashViewController: UIViewController {
    
    @IBOutlet weak var splasLabel: UILabel!
    @IBOutlet weak var splashImage: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.5, animations: {
            self.splasLabel.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.splashImage.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }) { (animated) in
            self.performSegue(withIdentifier: "showLogin", sender: nil)
        }
    }
}
