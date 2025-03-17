//
//  TodoViewController.swift
//  dudu
//
//  Created by dd_luliluli on 2024/7/15.
//

import Foundation
import UIKit

class TodoViewController: UIViewController {
    
    let todos = [
        Todo(title: "MaKe vanilla pudding."),
        Todo(title: "Put pudding in a mayo jarl"),
        Todo(title: "Eat it in a public place."),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


extension TodoViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "dahadas"
        
        return cell
    }
}
