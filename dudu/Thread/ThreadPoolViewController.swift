//
//  ThreadPoolViewController.swift
//  dudu
//
//  Created by dd_luliluli on 2024/11/12.
//

import UIKit
import MapKit

class ThreadPoolViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schedule()
        
    }
    
    func schedule() {
//        let item = DispatchWorkItem {
//            print("3333")
//        }
//        
        let mainQueue = DispatchQueue.main
        let globalQueue = DispatchQueue.global()
        let customQueue = DispatchQueue(label: "dsdsds")
//        let serialQueue = DispatchQueue(label: "dd", attributes: .initiallyInactive)
//        
        let item1 = DispatchWorkItem {
            for i in 0...4 {
                print("item -> \(i),  thread \(Thread.current)")
            }
        }
        
        let item2 = DispatchWorkItem {
            for i in 0...4 {
                print("item -> \(i), thread \(Thread.current)")
            }
        }
//        
        let item3 = DispatchWorkItem {
            for i in 0...4 {
                print("item -> \(i), thread \(Thread.current)")
            }
        }
        
        let item4 = DispatchWorkItem {
            for i in 0...4 {
                print("item -> \(i), thread \(Thread.current)")
            }
        }
        
        customQueue.async(execute: item1)
        customQueue.sync(execute: item2)
        customQueue.async(execute: item3)
        customQueue.async(execute: item4)
        
//        globalQueue.async {
//            
//            globalQueue.sync {
//                for i in 0...400  {
//                    print("\(-i)  heheheh, thread \(Thread.current)")
//                }
//            }
//            for i in 0...400 {
//                print("\(i)      dddd")
//            }
//        }
//        
//        globalQueue.async {
//            globalQueue.sync {
//                sleep(15)
//                print("dddddd ")
//            }
//        }
        
//        
//        globalQueue.async {
//            sleep(15)
//            print("3333 33")
//        }
        print("77777")
//        customQueue.async {
//            customQueue.sync {
//
//            }
//        }  // 会死锁
        
        
    }
    
}
