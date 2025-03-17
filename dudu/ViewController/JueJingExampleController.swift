//
//  JueJingExampleController.swift
//  dudu
//
//  Created by dd_luliluli on 2024/7/24.
//

import Foundation
import UIKit

class JueJingExampleController: UIViewController {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    private lazy var labelLeft: UILabel = {
        let label = UILabel()
        label.text = "编辑精选"
        label.textColor = .orange.withAlphaComponent(0.6)
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var labelLeft2: UILabel = {
        let label = UILabel()
        label.text = "只有一个古古怪怪古古怪怪滚滚滚滚滚滚"
        label.textColor = .red.withAlphaComponent(0.6)
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.distribution = .equalSpacing
        stackview.alignment = .center
        stackview.spacing = 10
        return stackview
    }()
    
    private(set) var btn: UIButton = {
        let button = UIButton.init()
        
        button.backgroundColor = UIColor.red
       
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.black, for: .selected)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -8, bottom: 0, right: 0.0)
        button.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 8, bottom: 0, right: 0.0)
    
        button.layer.cornerRadius = 20.0
        button.isSelected = true
        button.setTitle("dddd", for: .selected)
        return button
    }()
    
    override func viewDidLoad() {
        self.view.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        view.backgroundColor = .green.withAlphaComponent(0.4)
        labelLeft.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        labelLeft2.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
        stackView.addArrangedSubview(labelLeft2)
        stackView.addArrangedSubview(labelLeft)
        stackView.frame = CGRect(x: 100, y: 100, width: 150, height: 300)
        btn.frame = CGRect(x: 40, y: 40, width: 80, height: 80)
        btn.addTarget(self, action: #selector(didClick), for: .touchUpInside)
        view.addSubview(stackView)
        view.addSubview(btn)
        
    }
    
    @objc func didClick(){
        let view = TestViewController()
        self.navigationController?.pushViewController(view, animated: true)
    }
    
}
