//
//  TouXiangkuang.swift
//  dudu
//
//  Created by dd_luliluli on 2024/8/12.
//

//import Foundation
//import UIKit
//
//class TouXiangkuang: UIView {
//
//    private var imageView: UIView
//    private var gradientLayer: CAGradientLayer
//    private var shapeLayer: CAShapeLayer
//
//    init(frame: CGRect, backgroundColor: UIColor) {
//        imageView = UIView()
//        gradientLayer = CAGradientLayer()
//        shapeLayer = CAShapeLayer()
//        super.init(frame: frame)
//        setupView()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//    private func setupView() {
////        self.backgroundColor = UIColor.orange
////        imageView.backgroundColor = UIColor.yellow
//        // 设置 imageView
//        imageView.frame = bounds
//        imageView.contentMode = .scaleAspectFill
//        imageView.layer.masksToBounds = true
//
//        // 圆形遮罩
//        let maskLayer = CAShapeLayer()
//        maskLayer.path = UIBezierPath(ovalIn: imageView.bounds).cgPath
//        imageView.layer.mask = maskLayer
//
//        // 设置渐变图层
//        gradientLayer.frame = bounds
//        gradientLayer.colors = [UIColor.blue, UIColor.red]
//        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
//
//        // 设置圆形渐变边框
//        shapeLayer.lineWidth = 10
//        shapeLayer.path = UIBezierPath(ovalIn: bounds.insetBy(dx: 5, dy: 5)).cgPath
//        shapeLayer.fillColor = UIColor.green.cgColor
//
////        gradientLayer.mask = shapeLayer
//
//        addSubview(imageView)
//        imageView.backgroundColor = .clear
//        imageView.layer.addSublayer(gradientLayer)
//        print(imageView.layer.debugDescription)
////        layer.addSublayer(shapeLayer)
//    }
//
//
//}
//

import UIKit

class TouXiangkuang: UIView {
    
    private let gradientLayer: CAGradientLayer
    private let shapeLayer: CAShapeLayer
    private var containerViewHeight: CGFloat = 0
    private var containerViewWidth: CGFloat = 0
    
    override init(frame: CGRect) {
        gradientLayer = CAGradientLayer()
        shapeLayer = CAShapeLayer()
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        gradientLayer = CAGradientLayer()
        shapeLayer = CAShapeLayer()
        super.init(coder: coder)
        setupView()
    }
    
    private var containerView: UIView = {
        let view = UIView()
//        view.frame.
        return view
    }()
    
//    private func setupView() {
//        // 设置渐变图层
//        gradientLayer.frame = bounds
//        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
//        
//        // 添加渐变图层到视图的层
//        layer.addSublayer(gradientLayer)
//    }
    
    private func setupView() {
        // 设置圆弧路径
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        let insetBounds = bounds.insetBy(dx: 15, dy: 15)
        let path = UIBezierPath(ovalIn: insetBounds)
        
        // 配置 shapeLayer
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 15
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        // 添加 shapeLayer 到视图的层
//        shapeLayer.addSublayer(gradientLayer)
        gradientLayer.mask = shapeLayer
               
               // 添加渐变图层到视图的层
        layer.addSublayer(gradientLayer)
//        layer.addSublayer(shapeLayer)
        self.backgroundColor = UIColor.green
        
        containerViewHeight = self.bounds.height
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}
