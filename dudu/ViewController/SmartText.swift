//
//  SmartText.swift
//  dudu
//
//  Created by dd_luliluli on 2024/8/1.
//

import Foundation
import UIKit

class SmartText: UIViewController {
    
    private lazy var button: UIButton = {
        let btn  = UIButton()
        btn.frame = CGRect(x: 70, y: 70, width: 80, height: 80)
        btn.backgroundColor = UIColor.yellow
        return btn
    }()
    
    private lazy var middleButton: UIButton = {
        let btn  = UIButton()
        btn.frame = CGRect(x: 70, y: 120, width: 80, height: 80)
        btn.backgroundColor = UIColor.yellow
        return btn
    }()
    
    private lazy var buttonTw: UIButton = {
        let btn  = UIButton()
        btn.frame = CGRect(x: 70, y: 170, width: 80, height: 80)
        btn.backgroundColor = UIColor.yellow
        return btn
    }()
    
    private lazy var ddLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var iconView: TouXiangkuang = {
        let view = TouXiangkuang(frame: CGRect(x: 90, y: 340, width: 200, height: 200))
        
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.view.backgroundColor = UIColor.black
//        self.view.backgroundColor = UIColor.white
        self.view.addSubview(button)
        self.view.addSubview(buttonTw)
        self.view.addSubview(middleButton)
        button.addTarget(self, action: #selector(showTest), for: .touchUpInside)
        self.view.addSubview(iconView)
        
        let image = UIImage.init(resource: .fire)
        let smallImage = image.resizedForStandard(to: CGSize(width: 100, height: 100))
        let kMeans = OnAirGroupBackGroundColor()
        let points = smallImage.getPixels().map({OnAirGroupBackGroundColor.Point(from: $0)})
        let clusters = kMeans.cluster(points: points, into: 10)
        let middleIndex = OnAirGroupBackGroundColor.getSuitableBackGroundColor(clusters: clusters)
        
        let colors: [UIColor] = clusters.map { $0.center.toUIColor() }
        
        guard let mainColor = colors.first else {
            return
        }
        guard let seColor = colors.last else {
            return
        }
//        let dd =colors.count / 2
        
//        guard let middleColor = colors.indices.contains(middleIndex) else {
//            print("数组中没有中间的元素")
//            return
//        }

        print(mainColor)
        button.backgroundColor = mainColor
        
        
        print(middleIndex)
        
        print(seColor)
        buttonTw.backgroundColor = seColor
        print(colors.count)
        let semaphore = DispatchSemaphore(value: 0)
           
                self.middleButton.backgroundColor = middleIndex
                print(middleIndex)
        let viewdd = OnAirGroupLoadingDotView(frame: .zero)
        viewdd.frame = self.view.frame
        viewdd.isHidden = true
        viewdd.isHidden = false
        viewdd.startAnimation()
        self.view.addSubview(viewdd)
    }
    
    @objc func showTest() {
        if button.backgroundColor == UIColor.red {
            button.backgroundColor = UIColor.blue
        } else {
            button.backgroundColor = UIColor.red
        }
        print("hello")
        let dd = GuidanceViewController()
        
        present(dd, animated: true, completion: nil)

    }
    
    
    
    
    
    
}
