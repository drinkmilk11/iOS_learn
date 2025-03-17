//
//  GuidanceViewController.swift
//  dudu
//
//  Created by dd_luliluli on 2024/8/2.
//

import Foundation
import UIKit

protocol GuidanceViewControllerOutput: AnyObject {
    func dismissViewController()
}

protocol GuidanceViewControllerInput: AnyObject {
    func onSubmit()
    func onDismiss()
    func reportPopUpExposureEvent(id: Int64)
    func reportPopUpClickEvent(id: Int64, isSubmit: Bool)
}

class GuidanceViewController: UIViewController {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var bottomSafeAreaHeight: CGFloat = {
        var height: CGFloat = 0
        let bottomSafeAreaHeight = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        height = bottomSafeAreaHeight
        return height
    }()
    
    init(){
        super.init(nibName: nil, bundle: nil)
        
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .coverVertical
        print(bottomSafeAreaHeight)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        self.view.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
        setupUI()
    }
    
    // MARK: -Properties
    private var isShowAnimate = false
    
    private(set) var clickButton: UIButton = {
        let button = UIButton.init()
        button.setBackgroundColor(UIColor.green, for: .normal)
        button.setBackgroundColor(UIColor.green.withAlphaComponent(0.6), for: .selected)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        //        button.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -8, bottom: 0, right: 0.0)
        //        button.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 8, bottom: 0, right: 0.0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -(button.frame.width / 2), bottom: 0, right: -(button.frame.width / 2))
        button.layer.cornerRadius = 20.0
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.blue.cgColor

        button.isSelected = true
        button.setTitle("Got it", for: .selected)
        button.addTarget(self, action: #selector(dimissView), for: .touchUpInside)
        return button
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sync with “Focus”"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Buz’s voice auto-play now syncs with your phones “Focus” mode. You can easily manage this in Message Settings."
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.gray
        label.textAlignment = .center
        return label
    }()
    
    private var labelContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    private var subContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    
    private var lottieContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    //MARK: -SetUpUI
    
    func setupUI() {
        
        self.view.addSubview(lottieContainer)
        self.view.addSubview(subContainer)
        
        lottieContainer.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            make.height.equalTo(screenHeight * 0.4)
        }
        subContainer.snp.makeConstraints { make in
            make.top.equalTo(lottieContainer.snp.bottom)
            make.bottom.trailing.leading.equalToSuperview()
        }
        
        labelContainer.addSubview(titleLabel)
        labelContainer.addSubview(textLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        subContainer.addSubview(clickButton)
        clickButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-bottomSafeAreaHeight - 20)
            make.trailing.equalToSuperview().offset(-80)
            make.leading.equalToSuperview().offset(80)
            make.height.equalTo(56)
        }
        
        subContainer.addSubview(labelContainer)
        labelContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalTo(clickButton.snp.top)
        }
    }
    
   //MARK: -func about
   @objc func dimissView(){
        self.dismiss(animated: true, completion: nil)
    }
}

