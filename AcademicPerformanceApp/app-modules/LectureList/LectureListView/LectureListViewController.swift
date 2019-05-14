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
    
    var subject: Subject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        configurator.configure(with: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = subject?.name
        
        presenter.setUpViewWithData(subject)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        presenter.setUpViewWithData(nil)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! LiveLectureViewController
        
        vc.currentLecture = sender as? Lecture
    }
}

extension LectureListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lectureCell")!
        
        cell.textLabel?.text = presenter.getLecture(byId: indexPath.row).description!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueToQuestions", sender: presenter.getLecture(byId: indexPath.row))
    }
}
