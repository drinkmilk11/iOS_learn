//
//  PresenterTemplet.swift
//  dudu
//
//  Created by dd_luliluli on 2024/9/18.
//

import Foundation
import UIKit

class PresenterTemplet: NSObject & Presenterable {
    
    lazy var widgetsDispatcher: [String: Widgetable] = [:]
    
    func getWidget<T>(_ type: WidgetType) -> T {
        guard let widget = self.widgetsDispatcher[type.identifier] as? T else {
            fatalError("you did a mistake")
        }
        return widget
    }
    
    func getWidgetRootView(_ type: WidgetType) -> UIView? {
        guard let widget = self.widgetsDispatcher[type.identifier] else {
            fatalError("not founde wideget from \(type.identifier)")
        }
        return widget.rootView()
    }
    
    func viewDidLoad() {
        let sortedWidget = self.widgetsDispatcher.values.sorted{ $0.zIndex < $1.zIndex }
        for widget in sortedWidget {
            widget.viewDidLoad()
        }
        for widget in sortedWidget {
            widget.viewDidLayout()
        }
    }
    
    func viewWillAppear(_ animated: Bool) {
        let sortedWidget = self.widgetsDispatcher.values.sorted{ $0.zIndex < $1.zIndex }
        for widget in sortedWidget {
            widget.viewWillAppear(animated)
        }
    }
    
    func viewDidAppear(_ animated: Bool) {
        let sortedWidget = self.widgetsDispatcher.values.sorted { $0.zIndex < $1.zIndex }
        for widget in sortedWidget {
            widget.viewDidAppear(animated)
        }
    }
    
    func viewWillDisappear(_ animated: Bool) {
        let sortedWidget = self.widgetsDispatcher.values.sorted { $0.zIndex < $1.zIndex }
        for widget in sortedWidget {
            widget.viewWillDisappear(animated)
        }
    }
    
    func viewDidDisappear(_ animated: Bool) {
        let sortedWidget = self.widgetsDispatcher.values.sorted { $0.zIndex < $1.zIndex }
        for widget in sortedWidget {
            widget.viewDidDisappear(animated)
        }
    }
    
    
}
