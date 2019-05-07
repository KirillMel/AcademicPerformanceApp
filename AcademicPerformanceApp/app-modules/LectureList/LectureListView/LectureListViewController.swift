//
//  LectureListViewController.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/25/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class LectureListViewController: UIViewController, LectureListViewProtocol, ViperModuleTransitionHandler {
    @IBOutlet weak var tableView: UITableView!
    
    let configurator: LectureListConfiguratorProtocol = LectureListConfigurator()
    
    var presenter: LectureListPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        configurator.configure(with: self)
        
        presenter.setUpViewWithData()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}

extension LectureListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lectureCell")!
        
        cell.textLabel?.text = presenter.getLecture(byId: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueToQuestions", sender: nil)
    }
}
