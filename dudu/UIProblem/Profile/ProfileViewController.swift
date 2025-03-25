//
//  ProfileViewController.swift
//  dudu
//
//  Created by dd_luliluli on 2025/3/20.
//

class ProfileViewController: UIPresentationController {
    
    private var dimmingView: UIView?
    private var coverView: UIView?
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        guard let containerView = containerView else { return }
        
        // 添加遮罩层并设置初始透明度
        dimmingView = UIView(frame: containerView.bounds)
        dimmingView?.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        containerView.addSubview(dimmingView!)
        
        // 添加覆盖层防止触摸穿透
        coverView = UIView(frame: containerView.bounds)
        coverView?.backgroundColor = .clear
        coverView?.isUserInteractionEnabled = true
        containerView.addSubview(coverView!)
        
        // 启动遮罩动画
        dimmingView?.alpha = 0
        UIView.animate(withDuration: 0.3) {
            self.dimmingView?.alpha = 1
        }
    }
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        
        // 使用Auto Layout优化布局
        guard let containerView = containerView, let presentedView = presentedView else { return }
        
        presentedView.frame = CGRect(
            x: 20,
            y: containerView.bounds.height * 0.2,
            width: containerView.bounds.width * 0.8,
            height: containerView.bounds.height * 0.6
        )
        
        // 确保覆盖层尺寸与容器一致
        coverView?.frame = containerView.bounds
    }
    
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        
        // 动画结束后移除遮罩层
        UIView.animate(withDuration: 0.3, animations: {
            self.dimmingView?.alpha = 0
        }) { _ in
            self.dimmingView?.removeFromSuperview()
            self.coverView?.removeFromSuperview()
        }
    }
}
