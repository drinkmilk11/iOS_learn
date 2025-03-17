//
//  UserResearchViewController.swift
//  dudu
//
//  Created by dd_luliluli on 2024/8/2.
//

import Foundation
import UIKit

protocol UserResearchViewControllerOutput: AnyObject {
    func dismissViewController()
}

protocol UserResearchViewControllerInput: AnyObject {
    func onSubmit()
    func onDismiss()
    func reportPopUpExposureEvent(id: Int64)
    func reportPopUpClickEvent(id: Int64, isSubmit: Bool)
}

class UserResearchViewController: UIViewController {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    init(){
        super.init(nibName: nil, bundle: nil)
        
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .coverVertical
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        self.view.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
    }
    
    // MARK: -Properties
    private var isShowAnimate = false
    
    
    
}
