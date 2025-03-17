//
//  SettingProfileViewController.swift
//  dudu
//
//  Created by dd_luliluli on 2024/12/24.
//

import UIKit

class SettingProfileViewController: UIViewController {
    
    private var itemRadius: CGFloat = 20.0 //头像圆圈半价大小
    private var gapRadius: CGFloat = 4.0 //为中间间隔圆弧大小
    private var itemMaxNum: Int = 5
    
    private lazy var dudu: LivePlaceOlineMemberView = {
        let view = LivePlaceOlineMemberView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        
        print(dudu.frame)
        self.view.addSubview(dudu)
        dudu.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        print(dudu.frame)
    }
    
    
}
