//
//  TestViewController.swift
//  dudu
//
//  Created by dd_luliluli on 2024/7/24.
//

import Foundation
import UIKit

class TestViewController: UIViewController {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    init() {
        super.init(nibName: nil, bundle: nil)
        var navBarItem = UINavigationItem()
        navBarItem = self.navigationItem
        navBarItem.title = "你哈皮"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        view.backgroundColor = .blue.withAlphaComponent(0.4)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
}
