//
//  Reachability.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 5/14/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

