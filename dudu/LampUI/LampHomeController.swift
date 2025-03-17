//
//  LampHomeController.swift
//  dudu
//
//  Created by dd_luliluli on 2024/7/25.
//

import Foundation
import UIKit
import SnapKit


class LampHomeController: UIViewController, UIScrollViewDelegate {
    var top = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
    var width = UIScreen.main.bounds.width / 2
    var angle: Double = 0
    var timer: Timer?
    var on = true
    
    var from: Date = Date()
    var to: Date = Date()
    var isSmall = UIScreen.main.bounds.width < 750
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.backgroundColor = .white.withAlphaComponent(0.3)
        
        view.contentInsetAdjustmentBehavior = .never
        view.alwaysBounceVertical = true
        return view
    }()
    
    private lazy var scrollContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var circleView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray.withAlphaComponent(0.15)
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageview = UIImageView(image: .lamp)
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    private lazy var leftButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        
        return btn
    }()
    
    private lazy var circleViewSecond: UIView = {
        let view = UIView()
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: view.bounds.midX, y: view.bounds.midY), radius: 50, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        // 创建一个形状层
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.orange.cgColor
        
        // 添加阴影效果
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOffset = CGSize(width: 5, height: 5)
        shapeLayer.shadowOpacity = 0.15
        shapeLayer.shadowRadius = 5
        
        //左上角阴影层
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = circlePath.cgPath
        shadowLayer.fillColor = UIColor.orange.cgColor
        
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOffset = CGSize(width: -5, height: -5)
        shadowLayer.shadowOpacity = 0.15
        shadowLayer.shadowRadius = 5
        
        view.layer.addSublayer(shapeLayer)
        view.layer.addSublayer(shadowLayer)
        return view
    }()
    
    private lazy var smallCircleView: UIView = {
        let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.additionalSafeAreaInsets.top = -self.view.safeAreaInsets.top
        self.view.backgroundColor = UIColor.white
        self.view.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        setScrollView()
        setmainView()
        
    }
    
    func setScrollView(){
        let contentView = UIView()
        contentView.backgroundColor = .yellow
        scrollView.delegate = self
        scrollView.addSubview(scrollContainerView)
        scrollContainerView.addSubview(contentView)
        scrollContainerView.backgroundColor = .white.withAlphaComponent(0.3)
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        scrollContainerView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
            make.width.equalTo(screenWidth)
            make.height.equalTo(screenHeight)
        }
        //        contentView.snp.makeConstraints { make in
        //            make.width.equalTo(200)
        //            make.height.equalTo(200)
        //            make.centerX.equalToSuperview()
        //            make.centerY.equalToSuperview()
        //        }
        contentView.layer.cornerRadius = 100
        
        scrollContainerView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(150)
            make.width.equalTo(150)
            make.centerX.equalToSuperview()
            
        }
        
    }
    
    func setmainView() {
        scrollContainerView.addSubview(circleView)
        circleView.layer.cornerRadius = screenWidth / 4
        circleView.snp.makeConstraints { make in
            make.width.equalTo(screenWidth / 2)
            make.height.equalTo(screenWidth / 2)
            make.top.equalTo(imageView.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
        
        scrollContainerView.addSubview(circleViewSecond)
        circleViewSecond.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        circleViewSecond.addSubview(smallCircleView)
        smallCircleView.layer.cornerRadius = 10
        smallCircleView.backgroundColor = UIColor.blue
        smallCircleView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(20)
            make.size.equalTo(20)
        }
        
        circleViewSecond.layer.transform = CATransform3DMakeRotation(CGFloat(angle * CGFloat.pi / 180), 0, 0, 1)
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        smallCircleView.addGestureRecognizer(panGestureRecognizer)
        smallCircleView.isUserInteractionEnabled = true
        // 创建并启动定时器
        //        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateAngle), userInfo: nil, repeats: true)
        // 初始化长按手势识别器
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        
        // 设置长按手势识别的最短长按时间
        longPressGestureRecognizer.minimumPressDuration = 1.0
        
        // 将长按手势识别器添加到长按视图上
//        smallCircleView.touchAreaInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        circleViewSecond.isUserInteractionEnabled = true
        circleViewSecond.addGestureRecognizer(longPressGestureRecognizer)
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        switch gesture.state {
        case .began:
            print("拖拽开始")
            // 在这里可以添加拖拽开始时的逻辑
        case .changed:
            // 更新被拖拽视图的中心位置
            var center = smallCircleView.center
            center.x += translation.x
            center.y += translation.y
            smallCircleView.center = center
            
            // 重置手势的translation
            gesture.setTranslation(.zero, in: view)
        case .ended:
            print("拖拽结束")
            // 在这里可以添加拖拽结束时的逻辑
        case .cancelled, .failed:
            print("拖拽被取消或失败")
            // 在这里可以添加拖拽被取消或失败时的逻辑
        default:
            break
        }
    }

    
    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state == .began {
            // 长按手势开始
            print("长按手势开始")
            // 在这里实现你的长按手势开始后的逻辑
        } else if gestureReconizer.state == .ended {
            // 长按手势结束
            print("长按手势结束")
            // 在这里实现你的长按手势结束后的逻辑
        }
    }
    
    @objc func updateAngle() {
        angle += 10
        if angle >= 360 {
            angle = 0
        }
        
        // 更新视图的旋转效果
        let rotation = CATransform3DMakeRotation(CGFloat(angle * CGFloat.pi / 180), 0, 0, 1)
        circleViewSecond.layer.transform = rotation
    }
}


