//
//  AppDelegate.swift
//  dudu
//
//  Created by luliluli on 2024/5/30.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
//        let viewController = SmartText()
//        let viewController = LiveSpaceKnockViewController()
//        let viewController = MumuController()
//        let viewController = ThreadPoolViewController()
//        let viewController = CircleViewController()
        let viewController = DuduController()  //colletionView的动画
//        let viewController = PopUpTableviewController()  //colletionView的动画
//        let viewController = SettingProfileViewController()
        
//        let viewController = SliderViewController()
        let nav = UINavigationController(rootViewController: viewController)
//        let checkBox = Checkbox()
        window?.rootViewController = nav
//        window?.rootViewController = checkBox
        window?.makeKeyAndVisible()
        return true
    }
}

