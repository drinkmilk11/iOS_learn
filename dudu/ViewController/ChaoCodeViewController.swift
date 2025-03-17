//
//  ChaoCodeViewController.swift
//  dudu
//
//  Created by dd_luliluli on 2024/7/22.
//

import Foundation
import UIKit

protocol ActivityStore: AnyObject {
    func updateCurrentUserInfo()
    func reloadData()
}

class ChaoCodeViewController: UIViewController {
    
    let num = 14.13121321122
    let nameAgeMap = ["Ed": 443, "pppp": 9]  //
    let nums = [50, 5, 343, 33, 22, 22, 543, 11, 332]
//    let mm: BuzFontStyle = BuzFontStyleDc
    
    private lazy var textField: UITextField = {
        let text = UITextField()
        text.borderStyle = .roundedRect
        //text.placeholder = "dsdsas"
        
        text.frame = CGRect(x: 50, y: 50, width: 100, height: 40)
        return text
    }()
    
    
    override func viewDidLoad() {
        self.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.view.backgroundColor = UIColor.green
        setPlaceholder(textField: textField, placeholderText: "dsdsas")
        self.view.addSubview(textField)
        
        for index in nums.indices {
            print(nums[index])
        }
    }
    
    func setPlaceholder(textField: UITextField, placeholderText: String) {
            // 创建一个段落样式，用于设置对齐方式
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .right // 例如：将占位符文本设置为右对齐
            
            // 创建 attributes 字典，包含段落样式和其他属性
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: paragraphStyle,
                .foregroundColor: UIColor.lightGray // 可选：设置占位符文本的颜色
            ]
            
            // 创建带有对齐属性的 NSAttributedString
            let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
            
            // 将 NSAttributedString 赋给 UITextField 的 attributedPlaceholder 属性
            textField.attributedPlaceholder = attributedPlaceholder
        }
}

extension ChaoCodeViewController: ActivityStore {
    func updateCurrentUserInfo() {
        print("updateCurrentUserInfo clicked")
    }
    
    func reloadData() {
        print("ChaoCodeViewController clicked")
    }
    
    
}



