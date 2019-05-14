//
//  LiveLectureViewController.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/23/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit


class LiveLectureViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var messages = ["mesgfjhsdgfhsdgfhgd hfgsdfywgfyuwg ywgrywegruywg gfs dfjsbdkfs","tmp"]
    var questions = [Question]()
    
    var currentLecture: Lecture?
    
    let builder = EntityBuilder()
    let loader = ItemLoaderService<Question>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let lecture = currentLecture {
            self.title = lecture.description!
            self.loadQuestions(forLectureId: (currentLecture?.id!)!)
        }
        else {
            let liveLectureLoader = ItemLoaderService<LiveEntity>()
            liveLectureLoader.loadItems(folderName: "live") { result in
                if let result = result {
                    self.title = result.first?.lectureName ?? "Lecture"
                    self.currentLecture = Lecture(id: result.first!.lectureId!, subject: "Live", description: result.first!.lectureName!)
                    self.loadQuestions(forLectureId: (result.first?.lectureId)!)
                }
            }
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func loadQuestions(forLectureId id: String) {
        loader.loadItems(folderName: "questions") { result in
            for item in result! {
                if item.lectureId! == id {
                    self.questions.append(item)
                }
            }
            
            if (self.questions.count > 0) {
                self.tableView.reloadData()
                self.tableView.scrollToRow(at: IndexPath(row: self.questions.count - 1, section: 0), at: .bottom, animated: true)
            }
        }
    }
    
    @IBAction func sendButton_Clicked(_ sender: Any) {
        guard !textField.text!.isEmpty else { return }
        
        let question = Question(text: textField.text!, id: "\(questions.count)", lectureId: currentLecture!.id!)
        questions.append(question)
//        tableView.beginUpdates()
//        tableView.insertRows(at: [IndexPath(row: messages.count - 1, section: 0)], with: .automatic)
//        tableView.endUpdates()
//        tableView.scrollToRow(at: IndexPath(row: messages.count - 1, section: 0), at: .bottom, animated: true)
        
        
        let newValue = ["id": question.id!, "text": question.text!, "lectureId": question.lectureId!]
        
        builder.build(folder: "questions", value: newValue, id: question.id!)
        
        tableView.reloadData()
        tableView.scrollToRow(at: IndexPath(row: questions.count - 1, section: 0), at: .bottom, animated: true)
        
        textField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
        let destination = segue.destination as? AnswersListviewController
        
        destination?.currentQuestion = sender as? Question
    }
}

extension LiveLectureViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IncomeCell") as! IncomeBubbleCell
        
        cell.messageLabel.text = questions[indexPath.row].text!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellToDeSelect: UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        cellToDeSelect.contentView.backgroundColor = .white
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "segueToAnswers", sender: questions[indexPath.row])
    }
}
