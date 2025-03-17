//
//  Checkbox.swift
//  dudu
//
//  Created by dd_luliluli on 2024/7/15.
//

import Foundation
import UIKit

class Checkbox: UIView{
    private weak var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
     func setup() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        imageView.image = UIImage(systemName: "checkmark.square.fill")
        imageView.contentMode = .scaleAspectFit
        
        self.imageView = imageView
        
        backgroundColor = UIColor.clear
        
    }
    
}
