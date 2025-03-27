//
//  ProfileViewController.swift
//  dudu
//
//  Created by dd_luliluli on 2025/3/20.
//

import UIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    func presentAsSheet(from presentingViewController: UIViewController) {
        let sheetController = self
        let presentationController = sheetController.sheetPresentationController
        presentationController?.detents = [.medium(), .large()]
        presentationController?.prefersGrabberVisible = true
        presentationController?.animationController(forDismissed: sheetController) = nil
        presentationController?.backgroundStyle = .custom { context in
            let dimmingView = UIView(frame: context.container.bounds)
            dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            return dimmingView
        }
        presentationController?.prefersScrollingExpandsWhenScrolledToEdge = false
        presentationController?.prefersEdgeAttachedInCompactHeight = true
        presentationController?.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        presentationController?.selectedDetentIdentifier = .medium
        presentingViewController.present(sheetController, animated: true, completion: nil)
    }
}

// 使用示例
if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
   let window = windowScene.windows.first {
    let presentingVC = window.rootViewController
    let profileVC = ProfileViewController()
    profileVC.presentAsSheet(from: presentingVC!)
}
