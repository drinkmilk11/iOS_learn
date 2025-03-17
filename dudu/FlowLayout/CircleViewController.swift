//
//  CircleViewController.swift
//  dudu
//
//  Created by dd_luliluli on 2024/9/14.
//

import Foundation
import UIKit

class CircleViewController: UIViewController {
    
    let identifiter = "5555555"
    
//    private lazy var collectionView: UICollectionView = {
//        let layout = OwnFlowLayout.init()
//        layout.minimumLineSpacing = 10
//        layout.minimumInteritemSpacing = 10
//        layout.itemSize = CGSize.init(width: 60, height: 60)
//        layout.estimatedItemSize = .zero
//        layout.headerReferenceSize = .zero
//        layout.footerReferenceSize = .zero
//        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        return view
//    }()
    
    private lazy var button: UIButton = {
        let dd = UIButton()
        return dd
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        let flowLayout =  OwnFlowLayout()
        
        let collection = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: 320, height: 400), collectionViewLayout: flowLayout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: identifiter)
        collection.backgroundColor = .white
        self.view.addSubview(collection)
        
    }
    
//    func process<B>(_ input: B) -> String {
//        let formatted = format(input)
//    }
    
}

extension CircleViewController: UICollectionViewDelegate {
//    func collectionvie
}

extension CircleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifiter, for: indexPath)
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 25
        cell.backgroundColor = UIColor.init(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1)
        return cell
    }
   
    
}
