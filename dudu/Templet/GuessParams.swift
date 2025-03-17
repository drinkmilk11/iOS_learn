//
//  GuessParams.swift
//  dudu
//
//  Created by dd_luliluli on 2024/9/18.
//

import Foundation

enum WidgetType: Int {
    case main
    
    case navigationBar
    
    case callMember
    
    case actionBar
    
    case gifPlay
    
    case messageBanner
    
    
    var zIndex: Int {
        switch self {
        case .main:
            return 0
        case .navigationBar:
            return 1
        case .callMember:
            return 2
        case .actionBar:
            return 3
        case .gifPlay:
            return 4
        case .messageBanner:
            return 5
        }
    }
    
    var identifier: String {
        return String(describing: self)
    }
}

class GuessParams: NSObject {
    
    enum CallMode {
        case group
        case `private`
    }
    
    
}
