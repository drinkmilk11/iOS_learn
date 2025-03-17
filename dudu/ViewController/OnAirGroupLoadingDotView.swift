import Foundation
import UIKit

class OnAirGroupLoadingDotView: UIView {
    
    let dotOne = UIView()
    let dotTwo = UIView()
    let dotThree = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func startAnimation(){
        setupDots()
        startAnimatingDots()
    }
    
    func setupDots() {
        let dotSize: CGFloat = 8
        let dotColor = UIColor.white
        self.addSubview(dotOne)
        self.addSubview(dotTwo)
        self.addSubview(dotThree)
        [dotOne, dotTwo, dotThree].forEach { dot in
            dot.frame = CGRect(x: 0, y: 0, width: dotSize, height: dotSize)
            dot.layer.cornerRadius = dotSize / 2
            dot.backgroundColor = dotColor.withAlphaComponent(1.0)
            addSubview(dot)
        }

        let dotSpacing: CGFloat = 10
        let centerX = self.center.x

        dotOne.center = CGPoint(x: centerX - dotSpacing, y: self.center.y)
        dotTwo.center = CGPoint(x: centerX, y: self.center.y)
        dotThree.center = CGPoint(x: centerX + dotSpacing, y: self.center.y)
    }

    func startAnimatingDots() {
        animateDot(dot: dotOne, withDelay: 0.0)
        animateDot(dot: dotTwo, withDelay: 0.3)
        animateDot(dot: dotThree, withDelay: 0.6)
    }

    func animateDot(dot: UIView, withDelay delay: CFTimeInterval) {
        let animation = CAKeyframeAnimation(keyPath: "opacity")
        animation.values = [0.4, 0.8, 0.4]
        animation.keyTimes = [0, 0.5, 1]
        animation.duration = 0.9
        animation.beginTime = CACurrentMediaTime() + delay
        animation.repeatCount = .infinity
        dot.layer.add(animation, forKey: "onAirIconFade")
    }
}

