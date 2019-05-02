//
//  LectureListViewController.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/25/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class LectureListViewController: UIViewController {
    var lectureList = [Lecture]()
    let cellIdentifier = "lectureCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = Lecture(id: 0, subject: 1, description: "Nice lecture", questions: nil)
        let item2 = Lecture(id: 1, subject: 1, description: "Some fucking shit", questions: nil)
        
        lectureList.append(item1)
        lectureList.append(item2)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension LectureListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lectureList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        
        cell.textLabel?.text = lectureList[indexPath.row].description ?? ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueToQuestions", sender: nil)
    }
}
