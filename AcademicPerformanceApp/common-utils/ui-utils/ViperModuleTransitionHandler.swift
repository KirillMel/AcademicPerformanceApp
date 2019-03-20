//
//  ViperModuleTransitionHandler.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 2/1/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

typealias ConfigurationBlock = (Any?) -> Void

struct SegueInfo {
    var configurationBlock: ((Any?) -> Void)?
}

protocol ViperModuleTransitionHandler: class {
    func openModule(segueIdentifier: String, configurationBlock:@escaping (Any?) -> Void)
    
    func closeModule() -> Void
}

extension ViperModuleTransitionHandler where Self: UIViewController {
    func openModule(segueIdentifier: String, configurationBlock: @escaping (Any?) -> Void) {
        var segueInfo = SegueInfo()
        segueInfo.configurationBlock = configurationBlock
        performSegue(withIdentifier: segueIdentifier, sender: segueInfo)
    }
    
    func closeModule() {
        self.dismiss(animated: true, completion: nil)
    }
}
