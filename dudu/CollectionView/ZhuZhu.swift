//
//  ZhuZhu.swift
//  dudu
//
//  Created by dd_luliluli on 2024/8/28.
//

import Foundation
import UIKit

class ZhuZhu: UIView {
    var text = "oooo"
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        tapGesture.numberOfTapsRequired = 1 // 单击
        addGestureRecognizer(tapGesture)
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        doubleTapGesture.numberOfTapsRequired = 2 // 双击
        addGestureRecognizer(doubleTapGesture)
        
        // 确保双击识别失效后才会处理单击
        tapGesture.require(toFail: doubleTapGesture)
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(labelTapped))
        addGestureRecognizer(longPressGesture)
        
    }
    
    // 定义手势识别器触发的方法
    @objc func labelTapped(_ gestureRecognizer: UILongPressGestureRecognizer) {
        // 处理点击事件
        if gestureRecognizer.state == .ended {
            print("标签被点击了" + text)
        }
       
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print(text)
        // 首先检查自身是否应该响应这个触摸
        let hitView = super.hitTest(point, with: event)
        
        print(UIViewController.top())
        // 返回 nil，允许事件继续传递
        if text == "BB" {
            for subview in subviews {
                let convertedPoint = subview.convert(point, from: self)
                if let hitView = subview.hitTest(convertedPoint, with: event) {
                    return hitView
                }
            }
            return nil
        }
        
        return hitView
    }
}
