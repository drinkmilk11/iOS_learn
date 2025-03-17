//
//  OutPutController.swift
//  dudu
//
//  Created by dd_luliluli on 2024/7/26.
//

import Foundation
import UIKit

class OutPutController: UIViewController {
    
    weak var viewOutput: ActivityStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewOutput.updateCurrentUserInfo()
    }
}
