//
//  Presenterable.swift
//  dudu
//
//  Created by dd_luliluli on 2024/9/18.
//

import Foundation
import UIKit

protocol Presenterable: AnyObject {
    
//    init()
    
    
    /// 获取widget
    func getWidget<T>(_ type: WidgetType) -> T
    func getWidgetRootView(_ type: WidgetType) -> UIView?
    
    func viewDidLoad()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
}
