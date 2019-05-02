//
//  tmpVC.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/26/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class tmpVc: UIViewController {
    
    @IBOutlet weak var labl: UILabel!
    
    @IBAction func textChanged(_ sender: Any) {
        labl.text = (sender as! UITextField).text
    }
    
    @IBAction func newText(_ sender: UITextField) {
        labl.text = sender.text
    }
    
    
    @IBAction func tmp1(_ sender: Any) {
        labl.text = (sender as! UITextField).text
    }
    @IBAction func tmpThing(_ sender: UITextField) {
        labl.text = sender.text
    }
}
