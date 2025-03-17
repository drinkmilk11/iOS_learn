//
//  LocationController.swift
//  dudu
//
//  Created by dd_luliluli on 2024/7/22.
//

import Foundation
import UIKit
import MapKit

class LocationController: UIViewController {
    
    private lazy var mapView: MKMapView = {
        let view = MKMapView()
        
        view.showsUserLocation = true
        view.userTrackingMode = .follow
        view.delegate = self
        view.overrideUserInterfaceStyle = .light
        view.layoutMargins = .zero
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        
        return view
    }()
    
    private lazy var navGradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor.black.withAlphaComponent(0.6).cgColor,
            UIColor.black.withAlphaComponent(0.6).cgColor,
            UIColor.black.withAlphaComponent(0).cgColor,
        ]
        
        layer.locations = [
            0,
            0.6,
            1
        ]
        layer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100)
        return layer
    }()
    
    private lazy var userTrackButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hexString: "#191919")
        
        return button
    }()
    
    override func viewDidLoad() {
        self.view.addSubview(mapView)
        self.view.layer.addSublayer(navGradientLayer)
//        self.view.addSubview(navGradientLayer)
    }
}

extension LocationController: MKMapViewDelegate {
    
}

extension UIColor {
    convenience init?(hexString: String) {
        // 使用Swift标准库中的方法来解析十六进制字符串
        let scanner = Scanner(string: hexString)
        var hexNumber: UInt64 = 0
        var hasA: Bool = false
        
        scanner.scanHexInt64(&hexNumber)
        
        if scanner.isAtEnd {
            return nil
        }
        
        // 确保我们扫描到了有效的十六进制颜色代码
        if hexNumber > UInt64.max / 3 {
            return nil
        }
        
        // 解析Alpha通道
        if scanner.scanString("#", into: nil) {
            hasA = true
            if scanner.scanHexInt64(&hexNumber) {
                if scanner.isAtEnd {
                    return nil
                }
            }
        }
        
        // 创建UIColor对象
        self.init(red: CGFloat((hexNumber & 0xFF0000) >> 16) / 255,
                  green: CGFloat((hexNumber & 0x00FF00) >> 8) / 255,
                  blue: CGFloat(hexNumber & 0x0000FF) / 255,
                  alpha: hasA ? CGFloat(hexNumber) / 255 : 1.0)
    }
}
