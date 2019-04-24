//
//  AnswersListViewController.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/24/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class AnswersListviewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var question: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Answers"
        self.questionLabel?.text = question!
    }
    
    @IBAction func answerButton_Clicked(_ sender: Any) {
        
    }
}
