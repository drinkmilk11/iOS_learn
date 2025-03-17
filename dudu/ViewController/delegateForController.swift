//
//  delegateForController.swift
//  dudu
//
//  Created by dd_luliluli on 2024/7/19.
//

import Foundation
import UIKit

class delegateForController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = delegateController()
        vc.delegat = self
        vc.dd()
        vc.wuwu()
    }
    
}

extension delegateForController: duduDelegate {
    func didCheck() {
        print("wewewe")
    }
    
    func onSearch() {
        print("dsadaadda")
    }
    
    func onPrint() {
        print("opopopopopp")
    }
    
    
}
