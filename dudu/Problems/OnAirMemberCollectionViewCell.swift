//
//  File.swift
//  dudu
//
//  Created by dd_luliluli on 2024/8/19.
//

//
//  OnAirMemberCollectionViewCell.swift
//  buz
//
//  Created by dd_luliluli on 2024/8/14.
//  Copyright © 2024 lizhi. All rights reserved.
//

import UIKit
import UIKit

class OnAirMemberCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private(set) lazy var uiLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .red
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    func setUI() {
        self.addSubview(uiLabel)
        
    }
    public func updateUserInfo(num: Int) {
        uiLabel.text = String(num)
    }
}


