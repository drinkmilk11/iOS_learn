//
//  delegateController.swift
//  dudu
//
//  Created by dd_luliluli on 2024/7/19.
//

import Foundation
import UIKit

protocol duduDelegate: NSObjectProtocol {
    func didCheck()
    func onSearch()
    func onPrint()
}

protocol seseDelegate: NSObjectProtocol {
    func wuwu()
}
class delegateController: UIViewController {
    weak var delegat: duduDelegate?
    
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // delegat?.didCheck()
    }
    
    func dd(){
        delegat?.didCheck()
    }
}

extension delegateController: seseDelegate {
    func wuwu() {
        print("adcddcscdsdascdscd")
    }
    
    
}


