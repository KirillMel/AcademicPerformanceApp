//
//  AnswersListViewController.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/24/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

protocol AnswerDelegate: class {
    func addAnswer(_ answer: String) -> Void
}

class AnswersListviewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var answers = [Answer]()
    
    var question: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item = Answer(id: 1, text: "Answer 1", likedBy: nil, postedBy: 1)
        let item1 = Answer(id: 1, text: "Hey, Man! It is very long answer... 1 2 3 4 5 it is all", likedBy: nil, postedBy: 1)
        
        answers.append(contentsOf: [item, item1])
        
        self.title = "Answers"
        self.questionLabel?.text = question!
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.allowsSelection = false
    }
    
    @IBAction func answerButton_Clicked(_ sender: Any) {
        performSegue(withIdentifier: "segueToModal", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AnswerScreenViewController
        
        vc.answerDelegate = self
    }
}

extension AnswersListviewController: AnswerDelegate {
    func addAnswer(_ answer: String) {
        answers.append(Answer(id: 1, text: answer, likedBy: nil, postedBy: 1))
        tableView.reloadData()
    }
}

extension AnswersListviewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell") as! AnswerCell
        
        cell.answerLabel.text = answers[indexPath.row].text ?? ""
        cell.acceptImage.image = UIImage(named: "accept")
        cell.acceptImage.isHidden = true
        cell.AcceptButton.isHidden = true
        cell.likeImage.image = UIImage(named:"like")
        cell.viewForStudent.isHidden = false
        cell.numberOfLikes = 100
        cell.liked = false
        
        return cell
    }   
}
