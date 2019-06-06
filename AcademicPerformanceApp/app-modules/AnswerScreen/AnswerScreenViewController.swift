//
//  AnswerScreenViewController.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/25/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class AnswerScreenViewController: UIViewController {
    //MARK: - outlets
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var closeButton: UIBarButtonItem!
    @IBOutlet weak var answerButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    //MARK: - delegate, which connect to answer list
    var answerDelegate: AnswerDelegate!
    var answerText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let text = answerText {
            textView?.text = text
        } else {
            textView?.text = "Your Answer"
        }
    }
    
    func setUpUI() {
        //UI for button
        setShadow(for: answerButton)
        answerButton.layer.cornerRadius = MAIN_CORNER_RADIUS
        //UI for textView
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.cornerRadius = MAIN_CORNER_RADIUS
        //Set up close item in navigation bar
        closeButton.action = #selector(closeButton_Clicked)
    }
    //MARK: - VC methods
    @objc func closeButton_Clicked() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func answerButton_Clicked(_ sender: Any) {
        answerDelegate.addAnswer(textView.text)
        self.dismiss(animated: true, completion: nil)
    }
}
