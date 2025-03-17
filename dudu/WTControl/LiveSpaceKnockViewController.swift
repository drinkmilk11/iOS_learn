//
//  LiveSpaceKnockViewController.swift
//  dudu
//
//  Created by dd_luliluli on 2025/1/2.
//

import Foundation
import UIKit
import SnapKit

class LiveSpaceKnockViewController: UIViewController {
    
    private var knockView: LiveSpaceKnockView = {
        let view = LiveSpaceKnockView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
    }
    

    func setUI() {
        self.view.addSubview(knockView)
        knockView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

