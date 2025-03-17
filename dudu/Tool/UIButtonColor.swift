//
//  UIButtonColor.swift
//  dudu
//
//  Created by dd_luliluli on 2024/8/2.
//

import Foundation
import UIKit

public extension UIButton {
    @objc func setBackgroundColor(_ color: UIColor!, for state: UIControl.State){
        let bgImg :UIImage = UIImage.creatImage(color: color)
        self.setBackgroundImage(bgImg, for: state)
    }
}

public extension UIImage {
    static func creatImage(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
}
