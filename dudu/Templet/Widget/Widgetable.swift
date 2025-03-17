//
//  Widgetable.swift
//  dudu
//
//  Created by dd_luliluli on 2024/9/18.
//

import Foundation
import UIKit

protocol Widgetable: AnyObject {
//    init(_ presenter: )
    
    ///层级（越小越后面）
    var zIndex: Int { get }
    
    ///获取widget的根视图
    func rootView() -> UIView?
    
    func viewDidLoad()
    func viewDidLayout()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
}
