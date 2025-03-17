//
//  ArcedImageView.swift
//  dudu
//
//  Created by dd_luliluli on 2024/12/25.
//

import UIKit

class ArcedImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMask()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupMask()
    }

    private func setupMask() {
        // 创建一个完整矩形路径
        let fullPath = UIBezierPath(rect: bounds)

        // 圆弧中心点在视图的右边缘中间
        let arcCenter = CGPoint(x: bounds.maxX, y: bounds.midY)
        
        // 设置遮罩路径
        let arcRadius: CGFloat = min(bounds.width, bounds.height) / 2
        fullPath.addArc(withCenter: arcCenter, radius: arcRadius, startAngle: CGFloat.pi / 2, endAngle: 3 * CGFloat.pi / 2, clockwise: true)
        
        // 反转路径，裁剪圆弧
        fullPath.usesEvenOddFillRule = true

        // 创建 ShapeLayer
        let maskLayer = CAShapeLayer()
        maskLayer.path = fullPath.cgPath
        maskLayer.fillRule = .evenOdd

        // 设定遮罩
        self.layer.mask = maskLayer
    }
}

