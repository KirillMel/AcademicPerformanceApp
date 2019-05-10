//
//  tmpVC.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 4/26/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
   
    @IBOutlet weak var personalImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let items = [("about","About"), ("exit","Log out")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        buildHeaderView()
    }
   
    func buildHeaderView() {
        
        let user = UserDefaults.standard.getUser()!
        
        titleLabel.font = UIFont(name: "noteworthy-bold", size: 28)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Student"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = user.name
        nameLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = user.email
        
        
        personalImage.image = UIImage(named: "student")
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell")
        
        let item = items[indexPath.row]
        
        let image = UIImage(named: item.0)
        cell?.imageView?.image = image
        cell?.textLabel?.text = item.1
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            case 0: self.performSegue(withIdentifier: "segueToAbout", sender: nil)
            case 1: self.dismiss(animated: true, completion: nil)
            default: break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
