//
//  CustomCollectionViewCell.swift
//  dudu
//
//  Created by dd_luliluli on 2024/12/18.
//

import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    // 创建一个 UIImageView 用于显示图片
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        let font = UIFont(name: "Nunito-Bold", size: 20.0)
        label.font = font
        label.textColor = .black
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 设置 cell 的背景颜色
        contentView.backgroundColor = .lightGray
        
        // 将 imageView 添加到 contentView 并使用 SnapKit 进行布局
        contentView.addSubview(imageView)
        imageView.image = UIImage(named: "maomi")
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
        // 将 UILabel 添加到 contentView 中并使用 SnapKit 进行布局
        contentView.addSubview(numberLabel)
        numberLabel.snp.makeConstraints { make in
            make.leading.greaterThanOrEqualToSuperview().offset(8)
            make.top.equalToSuperview().offset(8)
            make.trailing.lessThanOrEqualToSuperview().offset(-8)
            make.centerX.equalToSuperview()
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
