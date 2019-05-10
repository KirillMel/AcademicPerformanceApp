//
//  SubjectListViewController.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/25/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class SubjectListViewController: UIViewController, SubjectListViewProtocol, ViperModuleTransitionHandler {
    let cellIdentifier = "subjectCell"
    
    var presenter: SubjectListPresenterProtocol!
    let configurator: SubjectListConfiguratorProtocol = SubjectListConfigurator()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        configurator.configure(with: self)
        presenter.setUpViewWithData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! LectureListViewController
                
        vc.subject = sender as? Subject
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension SubjectListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        
        let item = presenter.getSubject(byId: indexPath.row)
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.teacher
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = presenter.getSubject(byId: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "segueToLecturesList", sender: item)
    }
}
