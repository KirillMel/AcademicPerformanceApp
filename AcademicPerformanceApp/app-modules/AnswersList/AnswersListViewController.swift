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
    let loader = ItemLoaderService<Answer>()
    let builder = EntityBuilder()
    
    var currentQuestion: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.allowsSelection = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard Connectivity.isConnectedToInternet() else {
            self.displayAlert(title: "Error.", message: "Can't load questions. Check your internet connection.")
            return
        }
        
        if let question = currentQuestion {
            loader.loadItems(folderName: "answers") { result in
                for item in result! {
                    if item.questionId! == self.currentQuestion?.id! {
                        self.answers.append(item)
                    }
                }
                
                if (self.answers.count > 0) {
                    self.tableView.reloadData()
                }
            }
        }
        
        self.title = "Answers"
        self.questionLabel?.text = currentQuestion?.text!
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        answers = [Answer]()
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
        let id = UUID()
        let answer = Answer(id: "\(id)", text: answer, questionId: self.currentQuestion!.id!)
        answers.append(answer)
        tableView.reloadData()
        
        let newValue = ["id": answer.id!, "text": answer.text!, "questionId": answer.questionId!]
        
        builder.build(folder: "answers", value: newValue, id: answer.id!)
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
