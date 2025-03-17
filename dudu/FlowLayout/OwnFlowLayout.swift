//
//  OwnFlowLayout.swift
//  dudu
//
//  Created by dd_luliluli on 2024/9/14.
//

import Foundation

class OwnFlowLayout: UICollectionViewFlowLayout {
    private var itemCount: Int = 0
    private var attributeArray: [UICollectionViewLayoutAttributes] = []
    private var contentSize:CGSize = .zero
//    private let sectionInset = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    
    override func prepare() {
        super.prepare()
        self.attributeArray.removeAll()
        var Width = UIScreen.main.bounds.width
        itemCount = self.collectionView?.numberOfItems(inSection: 0) ?? 0
        var radius = min(self.collectionView?.frame.size.width ?? 0, self.collectionView?.frame.height ?? 0) / 2
        var center = CGPointMake((self.collectionView?.frame.size.width ?? 0) / 2, (self.collectionView?.frame.size.height ?? 0) / 2)
        
        for i in 0...itemCount {
            let indexPath = IndexPath(item: i, section: 0)
            var attris = collectionView?.layoutAttributesForItem(at: indexPath)
            attris?.size = CGSizeMake(50, 50)
            var temp = 2.0 * CGFloat(M_PI) / CGFloat(itemCount)
            var x = center.x + CGFloat(cosf(Float(temp)) * (Float(radius) - 25))
            var y = center.y + CGFloat(sinf(Float(temp)) * (Float(radius) - 25))
            
            attris?.center = CGPointMake(x, y)
            if let attris = attris {
                attributeArray.append(attris)
            }
            
        }
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.attributeArray.filter { $0.frame.intersects(rect) }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return self.attributeArray.first { $0.indexPath == indexPath }
    }
    
}
