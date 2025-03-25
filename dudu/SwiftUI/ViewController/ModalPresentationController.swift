//
//  Untitled.swift
//  dudu
//
//  Created by dd_luliluli on 2025/3/17.
//
//
//class CustomTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
//    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
//        return CustomPresentationController(presentedViewController: presented, presenting: presenting)
//    }
//    
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return CustomAnimationController(isPresenting: true)
//    }
//    
//    func animationController(forDismissed presented: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return CustomAnimationController(isPresenting: false)
//    }
//}
//
//class CustomPresentationController: UIPresentationController {
//    override var frameOfPresentedViewInContainerView: CGRect {
//        guard let container = containerView else { return .zero }
//        let defaultHeight: CGFloat = UIScreen.main.bounds.height * 0.8 // 默认覆盖高度
//        let customHeight: CGFloat = defaultHeight - 500 // 离底部500点
//        
//        // 根据条件选择高度（此处示例为固定条件，实际可动态获取）
//        let targetHeight = shouldUseCustomHeight ? customHeight : defaultHeight
//        
//        return CGRect(
//            x: 0,
//            y: container.bounds.height - targetHeight,
//            width: container.bounds.width,
//            height: targetHeight
//        )
//    }
//}
//
//class CustomAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
//    let isPresenting: Bool
//    
//    init(isPresenting: Bool) {
//        self.isPresenting = isPresenting
//    }
//    
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return 0.3
//    }
//    
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        guard let fromVC = transitionContext.viewController(forKey: .from),
//              let toVC = transitionContext.viewController(forKey: .to) else { return }
//        
//        let containerView = transitionContext.containerView
//        containerView.addSubview(toVC.view)
//        
//        if isPresenting {
//            toVC.view.frame = CGRect(
//                x: 0,
//                y: containerView.bounds.height,
//                width: containerView.bounds.width,
//                height: containerView.bounds.height
//            )
//            UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
//                toVC.view.frame = self.isPresenting ? self.targetFrame : .zero
//                containerView.backgroundColor = self.isPresenting ? .black.withAlphaComponent(0.5) : .clear
//            } completion: { _ in
//                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
//            }
//        } else {
//            UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
//                fromVC.view.alpha = 0
//                toVC.view.frame = .zero
//                containerView.backgroundColor = .clear
//            } completion: { _ in
//                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
//            }
//        }
//    }
//    
//    private var targetFrame: CGRect {
//        guard let container = containerView else { return .zero }
//        let defaultHeight: CGFloat = UIScreen.main.bounds.height * 0.8
//        let customHeight: CGFloat = defaultHeight - 500
//        
//        // 根据条件选择高度（此处示例为固定条件，实际可动态获取）
//        let targetHeight = shouldUseCustomHeight ? customHeight : defaultHeight
//        
//        return CGRect(
//            x: 0,
//            y: container.bounds.height - targetHeight,
//            width: container.bounds.width,
//            height: targetHeight
//        )
//    }
//}
