//
//  GroupManager.swift
//  dudu
//
//  Created by dd_luliluli on 2024/9/18.
//

//import Foundation
//import UIKit
//
//@objc protocol GroupManagerProtocol {
//    @objc optional func groupInfoUpdate()
//}
//
//public protocol Equatable {
//    static func == (lhs:Self, rhs:Self) -> Bool
//}
//
//class GroupManager: NSObject {
//    var hasValidCached = false
//    
//    @objc public static let shared = GroupManager()
//    
//    private(set) var weakDelegated: NSHashTable<GroupManagerProtocol> = NSHashTable.weakObjects()
//    
//    func notifyAllDelegates() {
//        print("3333333")
//        for delegate in weakDelegated.allObjects {
//            delegate.groupInfoUpdate?()
//        }
//    }
//}
//
//
//void executeInMainQueue(dispatch_block_t block) {
//    if(strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(dispatch_get_main_queue()) == 0) {
//        block()
//    }else {
//        dispatch_async(dispatch_get_main_queue(), block);
//    }
//       }
//       
//       dispatch_block_t mainQueueWrapper(dispatch_block_t block) {
//        return ^{
//            executeMainQueue(block);
//        }
//    }
