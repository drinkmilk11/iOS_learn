//
//  GestureController.swift
//  dudu
//
//  Created by dd_luliluli on 2024/7/18.
//

import Foundation
import UIKit


class GestureController: UIViewController {
    
    var squareView = UIView()
    lazy var containerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        containerView.frame = CGRect.init(x: 0, y: view.bounds.height - 300, width: view.bounds.width, height: 700)
        containerView.backgroundColor = .blue
        containerView.roundCorners([.topLeft, .topRight], radius: 20)
        view.addSubview(containerView)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        containerView.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.view)
        guard let gestureView = gesture.view else {
            return
        }

        switch gesture.state {
        case .began:
            // 手势开始
            break
        case .changed:
            gestureView.center = CGPoint(
                        x: gestureView.center.x,
                        y: max(min(gestureView.center.y + translation.y, self.view.bounds.height / 2 - gestureView.frame.height / 2),
                               gestureView.frame.height / 2)
                    )
            gesture.setTranslation(.zero, in: self.view)
        case .ended, .cancelled:
//            let velocity = gesture.velocity(in: self.view)
//            animateViewWithInertia(view: gestureView, velocity: velocity)
            snapToNearestEdge(view: gestureView)
        default:
            break
        }
    }

    func animateViewWithInertia(view: UIView, velocity: CGPoint) {
        let damping: CGFloat = 0.85
        let velocityMultiplier: CGFloat = 0.1
        let finalPosition = CGPoint(x: view.center.x + (velocity.x * velocityMultiplier), y: view.center.y + (velocity.y * velocityMultiplier))
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: damping, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            view.center = finalPosition
        }, completion: nil)
    }
    
    private func snapToNearestEdge(view: UIView) {
        // 获取屏幕边缘
        let screenBounds = self.view.bounds
        
        // 计算视图的水平中心位置
        let midX = view.frame.midX
        
        // 计算视图离各边的距离
        let leftDistance = midX
        let rightDistance = screenBounds.width - midX
        
        // 动画贴紧最近的边缘
        UIView.animate(withDuration: 0.3) {
            if leftDistance < rightDistance {
                view.frame.origin.x = 0 // 贴紧左边
            } else {
                view.frame.origin.x = screenBounds.width - view.frame.width // 贴紧右边
            }
        }
    }
}

extension UIView {func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    let mask = CAShapeLayer()
    
    mask.path = path.cgPath
    self.layer.mask = mask
}
}
