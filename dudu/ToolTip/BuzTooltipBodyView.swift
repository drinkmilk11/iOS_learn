////
////  Untitled.swift
////  dudu
////
////  Created by dd_luliluli on 2024/10/30.
////
//
//import UIKit
//
//public enum BuzTooltipButtonPlacement {
//    case right
//    case bottom
//}
//
//public class BuzTooltipBodyView: UIView {
//    var title: String?
//    var content: String?
//    var textAlignment: NSTextAlignment?
//    var buttonTitle: String?
//    var buttonPlacement: BuzTooltipButtonPlacement = .right
//    var buttonAction: (() -> Void)?
//    
//    
//    private lazy var verticalStackView: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .vertical
//        return stack
//    }()
//    
//    private lazy var horizontalStackView: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .horizontal
//        stack.spacing = 10
//        return stack
//    }()
//    
//    private lazy var titleLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 16.0)
//        label.textColor = .systemGray2
//        label.numberOfLines = 0
//        label.textAlignment = .natural
//        return label
//    }()
//    
//    private lazy var contentLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 13.0)
//        label.textColor = .systemGray2
//        label.numberOfLines = 0
//        label.textAlignment = .natural
//        return label
//    }()
//    
//    private lazy var horizontalButtonView: UIView = {
//        let view  = UIView()
//        return view
//    }()
//    
//    private lazy var confirmButton: UIButton = {
//        let button = UIButton(type: .system) // 创建一个系统类型的按钮
//        button.setTitle("Confirm", for: .normal) // 设置按钮的标题
//        button.backgroundColor = .blue // 设置按钮的背景颜色
//        button.layer.cornerRadius = 20.0
//        button.addTarget(self, action: #selector(self.onAction), for: .touchUpInside) // 添加点击事件
//        return button
//    }()
//    
//    public init(title: String? = nil,
//                content: String? = nil,
//                textAlignment: NSTextAlignment? = nil,
//                buttonTitle: String? = nil,
//                buttonPlacement: BuzTooltipButtonPlacement? = nil,
//                buttonAction: (() -> Void)? = nil) {
//        self.title = title
//        self.content = content
//        self.textAlignment = textAlignment
//        self.buttonTitle = buttonTitle
//        self.buttonAction = buttonAction
//        
//        if let buttonPlacement = buttonPlacement {
//            self.buttonPlacement = buttonPlacement
//        }
//        
//        super.init(frame: .zero)
//        
//        self.layoutViewComposition()
//    }
//    
//    required init?(code: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    public func configure(title: String?, content: String?) {
//        if let title = title {
//            self.titleLabel.text = title
//        }
//        if let content = content {
//            self.contentLabel.text = content
//        }
//    }
//    
//    private func layoutViewComposition() {
//        self.backgroundColor = .white
//        self.layer.cornerRadius = 16
//        horizontalStackView.addArrangedSubview(verticalStackView)
//        
//        if let title = self.title, !title.isEmpty {
//            titleLabel.text = title
//            verticalStackView.addArrangedSubview(titleLabel)
//        }
//        
//        if let content = self.content, !content.isEmpty {
//            contentLabel.text = content
//            verticalStackView.addArrangedSubview(contentLabel)
//        }
//        
//        if let buttonTitle = self.buttonTitle, !buttonTitle.isEmpty {
//            confirmButton.setTitle(buttonTitle, for: .normal)
//            
//            switch self.buttonPlacement {
//            case .right:
//                horizontalStackView.addArrangedSubview(horizontalButtonView)
//                horizontalButtonView.addSubview(confirmButton)
//                
//                let width = buttonTitle.getWidth(height: 32, font: )
//            case .bottom:
//                <#code#>
//            }
//        }
//    }
//    
//
//    @objc
//    private func onAction() {
//        self.buttonAction?()
//    }
//    
//    public func beginLoading() {
//        self.confirmButton.beginLoading()
//    }
//    
//    public func endLoading() {
//        self.confirmButton.endLoading()
//    }
//    
//    
//    
//}
//
