//
//  ControlViewController.swift
//  dudu
//
//  Created by dd_luliluli on 2024/11/26.
//

import Foundation
import UIKit
import SnapKit

class ControlViewController: UIViewController {
    
    enum Optional<Wrapped> {
        case one
        case some(Wrapped)
    }
    
    struct student<T> {
        var name: String
        var age: Int
        
        func greet(_ value: T) {
            print("It's good Time for you")
        }
    }
    
    struct Eq<A> {
        let eq:(A, A) -> Bool
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = UIImage(named: "maomi")?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), resizingMode: .tile) {
            view.backgroundColor = UIColor(patternImage: image)
        }
        
        setUI()
        
    }
    
    private lazy var ddLabel: UILabel = {
        let label = UILabel()
        label.text = "daskkodsadsoasdasd"
        return label
    }()
    
    private lazy var mmLabel: UILabel = {
        let label = UILabel()
        label.text = "dsd"
        return label
    }()
    
    private lazy var cucuLabel: UILabel = {
        let label = UILabel()
        label.text = "cucu"
        return label
    }()
    
    private lazy var vi: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 6.0
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    let rectangleLayer = CALayer()
    public func setUI() {
        
        // 创建一个长方形的 CALayer
        rectangleLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 30)
        rectangleLayer.cornerRadius = 15.0
        rectangleLayer.backgroundColor = UIColor.blue.cgColor
        
        // 设置初始锚点为底部中心 (0.5, 1.0)，模拟时钟分针的转动效果
        rectangleLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        // 将初始位置设置为视图的中心
        rectangleLayer.position = view.center
        
        // 将该矩形添加到主视图的层中
        view.layer.addSublayer(rectangleLayer)
        
        // 添加点击手势识别器
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)

            

    }
    
    @objc func handleTapMinute() {
        // 每次点击旋转 30 度
        let currentTransform = rectangleLayer.affineTransform()
        let newTransform = currentTransform.rotated(by: CGFloat.pi / 6) // 30度即π/6
        
        // 动画过渡
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.3)  // 动画持续时间
        rectangleLayer.setAffineTransform(newTransform)
        CATransaction.commit()
    }
    
    @objc func handleTap() {
        let shakeAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        
        let angle: CGFloat = .pi / 12
        shakeAnimation.values = [0, -angle, angle, 0]
        shakeAnimation.keyTimes = [0, 0.25, 0.75, 1]
        
        shakeAnimation.duration = 0.4
        shakeAnimation.repeatCount = 1
        shakeAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        shakeAnimation.isRemovedOnCompletion = true
        shakeAnimation.fillMode = .forwards
        
        rectangleLayer.add(shakeAnimation, forKey: "shakeAnimation")
    }
}

