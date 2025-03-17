//
//  ShinyEffectView.swift
//  dudu
//
//  Created by dd_luliluli on 2024/11/4.
//

import Foundation


class ShinyEffectView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAnimation()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupAnimation()
    }
    
    private func setupAnimation() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.withAlphaComponent(0.3).cgColor, UIColor.clear.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        gradientLayer.locations = [0.2, 0.3, 0.8]
        
        self.layer.addSublayer(gradientLayer)
        
//        let animation = CABasicAnimation(keyPath: "transform.translation.x")
//        animation.fromValue = -self.bounds.size.width
//        animation.toValue = self.bounds.size.width
//        animation.duration = 2
//        animation.repeatCount = .infinity
//        
//        gradientLayer.add(animation, forKey: "shimmer")
    }
}


