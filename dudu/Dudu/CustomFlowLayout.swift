//
//  CustomFlowLayout.swift
//  dudu
//
//  Created by dd_luliluli on 2024/12/18.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {

    private var insertIndexPathArr: [IndexPath] = []
    private var deleteIndexPathArr: [IndexPath] = []
    private var movedIndexPathArr: [(from: IndexPath, to: IndexPath)] = []
    
    private var layoutAttributes: [UICollectionViewLayoutAttributes] = []
    private var contentSize: CGSize = .zero
    
    private(set) var currentGridType: GridType = .twoGrid

    override var collectionViewContentSize: CGSize {
        return contentSize
    }

    // 宫格类型定义
    enum GridType {
        case twoGrid // 二宫格
        case fourGrid // 四宫格
        case sixGrid // 六宫格
        case nineGrid // 九宫格
        case twelveGrid // 十二宫格
    }
    
    // 动态识别宫格类型
    private func gridType(for itemCount: Int) -> (GridType, columns: Int, rows: Int) {
        switch itemCount {
        case 1, 2:
            return (.twoGrid, 1, 2) // 二宫格
        case 3, 4:
            return (.fourGrid, 2, 2) // 四宫格
        case 5, 6:
            return (.sixGrid, 2, 3) // 六宫格
        case 7...9:
            return (.nineGrid, 3, 3) // 九宫格
        case 10...12:
            return (.twelveGrid, 3, 4) // 十二宫格
        default:
            return (.twoGrid, 1, 1) // Fallback for unexpected counts
        }
    }
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        let itemCount = collectionView.numberOfItems(inSection: 0)
        
        let (top, bottom) = getTopBottomOffsets(for: itemCount)
        self.sectionInset = .init(top: top, left: 10.0, bottom: bottom, right: 10.0)
        self.minimumLineSpacing = 20.0
        self.minimumInteritemSpacing = 20.0
        
        self.layoutAttributes.removeAll()
        let availableWidth = collectionView.bounds.width - sectionInset.left - sectionInset.right
        let availableHeight = collectionView.bounds.height - sectionInset.top - sectionInset.bottom
        
        
        // 动态获取宫格类型及列数和行数
        let (gridType, numberOfColumns, numberOfRows) = gridType(for: itemCount)
        self.currentGridType = gridType  // 更新当前宫格类型
        
        let itemWidth = (availableWidth - CGFloat(numberOfColumns - 1) * minimumInteritemSpacing - 20) / CGFloat(numberOfColumns)
        let itemHeight = (availableHeight - CGFloat(numberOfRows - 1) * minimumLineSpacing - 20) / CGFloat(numberOfRows)
        
        self.contentSize = CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
        
        for itemIndex in 0..<itemCount {
            let indexPath = IndexPath(item: itemIndex, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            let row = itemIndex / numberOfColumns
            let column = itemIndex % numberOfColumns
            
            let xPosition = sectionInset.left + CGFloat(column) * (itemWidth + minimumInteritemSpacing)
            let yPosition = sectionInset.top + CGFloat(row) * (itemHeight + minimumLineSpacing)
            
            attributes.frame = CGRect(x: xPosition, y: yPosition, width: itemWidth, height: itemHeight)
            self.layoutAttributes.append(attributes)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.layoutAttributes.filter { $0.frame.intersects(rect) }
    }
    

    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if let attributes = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath) ?? layoutAttributes.first(where: { $0.indexPath == itemIndexPath })?.copy() as? UICollectionViewLayoutAttributes {
            if insertIndexPathArr.contains(itemIndexPath) {
                attributes.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
                attributes.alpha = 0
            }
            return attributes
        }
        
        return nil
    }

    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if let attributes = super.finalLayoutAttributesForDisappearingItem(at: itemIndexPath) ?? layoutAttributes.first(where: { $0.indexPath == itemIndexPath })?.copy() as? UICollectionViewLayoutAttributes {
            if deleteIndexPathArr.contains(itemIndexPath) {
                attributes.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
                attributes.alpha = 0
            }
            return attributes
        }
        
        return nil
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if let attributes = layoutAttributes.first(where: { $0.indexPath == indexPath }) {
            if let move = movedIndexPathArr.first(where: { $0.from == indexPath }) {
                // 处理移动的项目
                attributes.frame = layoutAttributesForItem(at: move.to)?.frame ?? attributes.frame
            }
            return attributes
        }
        return nil
    }

    
    private func getTopBottomOffsets(for itemCount: Int) -> (CGFloat, CGFloat) {
        if itemCount <= 2 {
            return (0, 0)
        } else if itemCount <= 4 {
            return (20, 20)
        } else {
            return (10, 10)
        }
    }
    
    func prepareForInsertion(indexPaths: [IndexPath]) {
        insertIndexPathArr = indexPaths
    }

    func prepareForDeletion(indexPaths: [IndexPath]) {
        deleteIndexPathArr = indexPaths
    }
    
    func prepareForMove(indexPaths: [(from: IndexPath, to: IndexPath)]) {
        movedIndexPathArr = indexPaths
    }

    func clearIndexPaths() {
        insertIndexPathArr.removeAll()
        deleteIndexPathArr.removeAll()
        movedIndexPathArr.removeAll()
    }
}
