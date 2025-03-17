//
//  ShowExampleController.swift
//  dudu
//
//  Created by dd_luliluli on 2024/7/25.
//

import UIKit

class ShowExampleController: UIViewController {
     weak var circleView: UIView!
     weak var angleLabel: UILabel!
    
    var angle: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建一个圆形路径
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: circleView.bounds.midX, y: circleView.bounds.midY), radius: circleView.bounds.midX - 22.5, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        // 创建一个形状层
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        
        // 添加阴影效果
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOffset = CGSize(width: 5, height: 5)
        shapeLayer.shadowOpacity = 0.15
        shapeLayer.shadowRadius = 5
        
        // 添加旋转效果
        shapeLayer.transform = CATransform3DMakeRotation(CGFloat(angle * CGFloat.pi / 180), 0, 0, 1)
        
        // 添加形状层到视图
        circleView.layer.addSublayer(shapeLayer)
        
        // 更新角度标签
        angleLabel.text = "\(angle)°"
    }
    
    // 更新角度的方法，例如在按钮点击时调用
//    func updateAngle() {
//        angle += 10
//        if angle >= 360 {
//            angle = 0
//        }
//        
//        // 更新形状层的旋转效果
//        shapeLayer.transform = CATransform3DMakeRotation(CGFloat(angle * CGFloat.pi / 180), 0, 0, 1)
//        
//        // 更新角度标签
//        angleLabel.text = "\(angle)°"
//    }
}

