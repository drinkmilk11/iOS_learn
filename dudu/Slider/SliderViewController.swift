//
//  SliderViewController.swift
//  dudu
//
//  Created by dd_luliluli on 2024/12/18.
//


import UIKit

class RoundedSlider: UISlider {
    var trackHeight: CGFloat = 10.0
    private var maskLayer: CAShapeLayer?

    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let defaultRect = super.trackRect(forBounds: bounds)
        return CGRect(x: defaultRect.origin.x, y: defaultRect.origin.y + (defaultRect.height - trackHeight) / 2, width: defaultRect.width, height: trackHeight)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if maskLayer == nil {
            let maskPath = UIBezierPath(roundedRect: bounds, cornerRadius: trackHeight / 2)
            maskLayer = CAShapeLayer()
            maskLayer?.path = maskPath.cgPath
            self.layer.mask = maskLayer
        }
    }
}

class SliderViewController: UIViewController {

    let slider = RoundedSlider()

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置滑块的位置和大小
        slider.frame = CGRect(x: 20, y: view.frame.height / 2, width: view.frame.width - 40, height: 20)

        // 设置最小值和最大值
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0

        // 初始值
        slider.value = 0.5

        // 设置颜色
        slider.minimumTrackTintColor = UIColor.green
        slider.maximumTrackTintColor = UIColor.lightGray

        // 添加滑块值改变时的监听
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)

        // 添加触摸事件
        slider.addTarget(self, action: #selector(sliderTouchDown(_:)), for: [.touchDown, .touchDragInside])
        slider.addTarget(self, action: #selector(sliderTouchUp(_:)), for: [.touchUpInside, .touchUpOutside, .touchCancel])

        // 添加到视图中
        view.addSubview(slider)
    }

    @objc func sliderValueChanged(_ sender: UISlider) {
        // 处理滑块值的变化
        print("Slider value: \(sender.value)")
    }

    // 用户开始触摸滑块
    @objc func sliderTouchDown(_ sender: UISlider) {
        UIView.animate(withDuration: 0.2) {
            if let roundedSlider = sender as? RoundedSlider {
                roundedSlider.trackHeight = 20 // 增大轨道高度
                roundedSlider.layer.mask = nil // 重置mask
                roundedSlider.setNeedsLayout()
            }
        }
    }

    // 用户结束触摸滑块
    @objc func sliderTouchUp(_ sender: UISlider) {
        print("Final value: \(sender.value)")
        UIView.animate(withDuration: 0.2) {
            if let roundedSlider = sender as? RoundedSlider {
                roundedSlider.trackHeight = 10 // 恢复轨道正常高度
                roundedSlider.layer.mask = nil // 重置mask
                roundedSlider.setNeedsLayout()
            }
        }
    }
}
