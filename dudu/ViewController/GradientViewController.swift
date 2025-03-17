//
//  GradientViewController.swift
//  dudu
//
//  Created by dd_luliluli on 2024/7/17.
//

import Foundation
import UIKit

class GradientViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navGradient = CAGradientLayer()  //渐变层实例
        navGradient.frame = CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height / 2)
        navGradient.colors = [UIColor.blue.cgColor, UIColor.green.cgColor]
    
        navGradient.startPoint = CGPoint(x: 0.5, y: 0)  //从顶部中心开始
        navGradient.endPoint = CGPoint(x: 0.5, y: 1)   // 到底部中心结束
        
        self.view.layer.addSublayer(navGradient)
        
        
        
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor.blue.withAlphaComponent(0.6).cgColor,
            UIColor.blue.withAlphaComponent(0.6).cgColor,
            UIColor.blue.withAlphaComponent(0).cgColor,
        ]
        layer.locations = [0, 0.5, 1]
    }
}
