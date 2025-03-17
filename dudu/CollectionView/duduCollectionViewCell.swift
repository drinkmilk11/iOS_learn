//
//  File.swift
//  dudu
//  duduCollectionViewCell
//  Created by dd_luliluli on 2024/8/24.
//

import UIKit

class duduCollectionViewCell: UICollectionViewCell {
    var id = 0
    var hasShown: Bool = false
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.text = "popopop"
        return label
    }()
    
    // 重写初始化方法，将UILabel添加到contentView中
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        
        // 使用SnapKit设置label的约束
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        backgroundColor = UIColor.white
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        contentView.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 配置单元格中的UILabel
    func configure(with text: String, identifier: Int) {
        
//        if hasShown == false {
//            hasShown = true
//        }else {
//            animateWhenSelected()
//        }
        self.label.text = text
       
        //        if hasShown == false {
        //            UIView.animate(withDuration: 10) {
        //
        //                self.layoutIfNeeded()
        //            } completion: { finish in
        //                self.hasShown = true
        //            }
        //        }
        
    }
    
    @objc func handleTap() {
        // 改变背景颜色为黄色
        
        
        // 添加动画
        animateWhenSelected()
    }
    
    // 单元格被点击时的动画
    func animateWhenSelected() {
        UIView.animate(withDuration: 10, animations: {
            self.backgroundColor = .red
        }) { _ in
            // 动画完成后恢复原始颜色
//            self.backgroundColor = .white
        }
        
       
    }
    
}
