//
//  LiveSpaceKnockView.swift
//  dudu
//
//  Created by dd_luliluli on 2025/1/2.
//

import UIKit
import SnapKit

class LiveSpaceKnockView: UIView {

    private var liveSpaceNavBar: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view  = UIView()
        return view
    }()
    
    private(set) lazy var spaceBGImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 50.0
        view.clipsToBounds = true
        view.image = UIImage(named: "Countryside_morning")
        return view
    }()

    private lazy var topImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "maomi")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("ppp", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)

        // 设置按钮的图片
        let image = UIImage(named: "liveplace_knock")
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.semanticContentAttribute = .forceLeftToRight
        button.contentHorizontalAlignment = .center
        button.adjustsImageWhenHighlighted = false

        // 设置内容边距
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        button.layer.cornerRadius = 28.0
        return button
    }()
    
    private let tipsLabel: UILabel = {
        let label = UILabel()
        label.text = "Maggi’s Live Place is not open yet"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()

    private let subLabel: UILabel = {
        let label = UILabel()
        label.text = "to let Maggi know you are here!"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initViews() {
        // 背景图像
        self.addSubview(spaceBGImageView)
        spaceBGImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.addSubview(liveSpaceNavBar)
        liveSpaceNavBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(54)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(80)
        }
        
        self.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalTo(liveSpaceNavBar.snp.bottom)
            make.bottom.leading.trailing.equalToSuperview()
        }
        
        containerView.addSubview(contentView)
        
        contentView.addSubview(tipsLabel)
        tipsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(44)
            make.centerX.equalToSuperview()
            make.leading.greaterThanOrEqualToSuperview().offset(20)
            make.trailing.lessThanOrEqualToSuperview().offset(-20)
        }
        
        contentView.addSubview(topImageView)
        topImageView.snp.makeConstraints { make in
            make.top.equalTo(tipsLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(56)
        }
        
        contentView.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalTo(topImageView.snp.bottom).offset(108)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(56)
        }

        
        contentView.addSubview(subLabel)
        subLabel.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom).offset(20)
            make.leading.greaterThanOrEqualToSuperview().offset(20)
            make.trailing.lessThanOrEqualToSuperview().offset(-20)
            make.centerX.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(tipsLabel.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(subLabel.snp.bottom)
            make.center.equalToSuperview()
        }

        // 添加点击手势识别器到按钮
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
       
        
    }

    @objc func handleTap() {
        let shakeAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")

        let angle: CGFloat = .pi / 60
        shakeAnimation.values = [0, -angle, angle, 0]
        shakeAnimation.keyTimes = [0, 0.25, 0.75, 1]
        shakeAnimation.duration = 0.3
        shakeAnimation.repeatCount = 1
        shakeAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)

        button.layer.add(shakeAnimation, forKey: "shakeAnimation")
        self.button.setImage(nil, for: .normal)
        self.button.layoutIfNeeded()
        UIView.animate(withDuration: shakeAnimation.duration, animations: {
            // 将透明度调整为40%
            self.button.backgroundColor = UIColor.white.withAlphaComponent(0.4)

            // 暂时隐藏图标
            self.button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -55, bottom: 0, right: 55) // 图标隐藏并左移文字
            self.spaceBGImageView.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)

        }, completion: { _ in
            // 恢复到初始状态
            
            UIView.animate(withDuration: 0.2) {
                self.button.backgroundColor = UIColor.white.withAlphaComponent(0.2)
                self.spaceBGImageView.transform = .identity
                // 恢复图标和文字位置
                let image = UIImage(named: "liveplace_knock")
                self.button.setImage(image, for: .normal)
                self.button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
            }
        })
    }
    
    func hasRoundedCorners() -> (hasRounded: Bool, cornerRadius: CGFloat) {
        if let window = UIApplication.shared.windows.first {
            let topInset = window.safeAreaInsets.top
            let bottomInset = window.safeAreaInsets.bottom
            
            // 假设有圆角或凹口时的边距阈值
            if topInset > 20 || bottomInset > 20 {
                return (true, max(topInset, bottomInset))
            }
        }
        return (false, 0) // No rounded corners
    }
}
