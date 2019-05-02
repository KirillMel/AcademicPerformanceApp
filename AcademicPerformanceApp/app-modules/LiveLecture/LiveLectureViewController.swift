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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Lecture"
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    @IBAction func sendButton_Clicked(_ sender: Any) {
        guard !textField.text!.isEmpty else { return }
        
        messages.append(textField.text!)
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: messages.count - 1, section: 0)], with: .automatic)
        tableView.endUpdates()
        tableView.scrollToRow(at: IndexPath(row: messages.count - 1, section: 0), at: .bottom, animated: true)
        
        textField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
        let destination = segue.destination as? AnswersListviewController
        
        destination?.question = sender as? String
    }
}

extension LiveLectureViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IncomeCell") as! IncomeBubbleCell
        
        cell.messageLabel.text = messages[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellToDeSelect: UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        cellToDeSelect.contentView.backgroundColor = .white
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "segueToAnswers", sender: messages[(indexPath.row)])
    }
}
