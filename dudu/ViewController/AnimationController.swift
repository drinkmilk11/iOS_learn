//
//  AnimationController.swift
//  dudu
//
//  Created by dd_luliluli on 2024/7/30.
//

import Foundation
import UIKit

class AnimationController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.view.backgroundColor = .white
       
        
        let ddView = UIView(frame: CGRect.init(x: 30, y: 40, width: 100, height: 100))
        ddView.alpha = 0
        ddView.backgroundColor = UIColor.blue
        UIView.animate(withDuration: 3, delay: 0, options: .curveEaseInOut, animations: {
            ddView.alpha = 1.0
            ddView.backgroundColor = .red
        })

        UIView.animateKeyframes(withDuration: 8, delay: 0, animations: {
            // 第一个关键帧动画
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                ddView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1) // 放大视图
            }
            
            // 第二个关键帧动画
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                ddView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9) // 缩小视图
            }
            
            // 第三个关键帧动画，恢复到原始大小
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                ddView.transform = CGAffineTransform.identity // 恢复到原始状态
            }
        })

//        UIView.animate(withDuration: 3, animations: {
//            ddView.frame = CGRect.init(x: 280, y: 80, width: 150, height: 150)
//            ddView.backgroundColor = .purple
//        })
        self.view.addSubview(ddView)
    }
    
    
}
