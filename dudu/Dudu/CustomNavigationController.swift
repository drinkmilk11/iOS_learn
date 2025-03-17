////
////  CustomNavigationController.swift
////  dudu
////
////  Created by dd_luliluli on 2025/3/12.
////
//
//import UIKit
//import SDWebImage
//
//class CustomNavigationController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//    
//
//    var collectionView: UICollectionView!
//    var data = ["A你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好"] // 示例初始数据
//    var now = 3;
//    
//    private let button: UIButton = {
//        let btn = UIButton()
//        btn.frame = CGRect(origin: CGPoint(x: 60, y: 60), size: CGSize(width: 80, height: 80))
//        btn.backgroundColor = UIColor.purple
//        btn.addTarget(self, action: #selector(handleImage), for: .touchUpInside)
//        return btn
//    }()
//    
//    private let imageView: UIImageView = {
//        let view = UIImageView(image: UIImage.init(resource: .fire))
//        return view
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // 初始化布局
//        let layout = CustomFlowLayout()
//        
//        // 初始化 collectionView
//        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        
//        // 注册自定义 Cell
//        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
//        
//        // 添加到主视图
//        self.view.addSubview(collectionView)
//        self.view.addSubview(button)
//        self.view.addSubview(imageView)
//        
//        imageView.frame = CGRect(x: 50, y: 300, width: 50, height: 50)
//        
////        let vc = ExampleViewController()
////        let nav = UINavigationController(rootViewController: vc)
////        nav.modalPresentationStyle = .overFullScreen
////        nav.modalTransitionStyle = .crossDissolve
////        self.present(nav, animated: true)
//    }
//
//
//    
//    @objc func insertItemWu() {
//        if data.count <= 11 {
//            data.insert("\(now)", at: 1) // 插入新元素（替换相应的代码）
//            now = now + 1
//            var newIndexPath = IndexPath(item: 1,section: 0)
////            let newIndexPath = IndexPath(item: indexpath.row, section: 0)
//            if let layout = collectionView.collectionViewLayout as? CustomFlowLayout {
//                layout.prepareForInsertion(indexPaths: [newIndexPath])
//            }
//            UIView.animate(withDuration: 1.5) {
//                self.collectionView.performBatchUpdates({
//                    self.collectionView.insertItems(at: [newIndexPath])
//                }, completion: { _ in
//                    self.collectionView.collectionViewLayout.invalidateLayout() // 强制刷新布局
//                    if let layout = self.collectionView.collectionViewLayout as? CustomFlowLayout {
//                        layout.clearIndexPaths() // 清除所有 index paths 防止重复动画
//                    }
//                })
//            }
//        }
//    }
//
//    @objc func insertNewItemAtFifthPosition(indexpath: IndexPath) {
//        if data.count <= 8 {
//            data.insert("\(now)", at: 1) // 插入新元素（替换相应的代码）
//            now = now + 1
//            var newIndexPath = IndexPath(item: 0,section: 0)
////            var newddIndexPath = IndexPath(item: 2,section: 0)
////            let newIndexPath = IndexPath(item: indexpath.row, section: 0)
//            if let layout = collectionView.collectionViewLayout as? CustomFlowLayout {
//                layout.prepareForInsertion(indexPaths: [newIndexPath])
//            }
//            let memberArray = [1, 3, 5, 1, 9]
//            var members = memberArray
//            members.swapAt(1, 2)
//            NSLog("\(members)")
//            DispatchQueue.main.async {
//                UIView.animate(withDuration: 1.5) {
//                    self.collectionView.performBatchUpdates({
//                        self.collectionView.insertItems(at: [newIndexPath])
//                        NSLog("pppp   \(self.collectionView.visibleCells.count)")
//                        for cell in self.collectionView.visibleCells {
//                            cell.contentView.backgroundColor = .blue
//                        }
//                    }, completion: { _ in
//                        self.collectionView.collectionViewLayout.invalidateLayout() // 强制刷新布局
//                        if let layout = self.collectionView.collectionViewLayout as? CustomFlowLayout {
//                            layout.clearIndexPaths() // 清除所有 index paths 防止重复动画
//                        }
//                        for cell in self.collectionView.visibleCells {
//                            cell.contentView.backgroundColor = .white
//                        }
//                    })
//                }
//            }
//           
//        } else {
//            let num = data[5]
//            data.remove(at: 5)
//            data.insert(num, at: 1)
//            if let layout = collectionView.collectionViewLayout as? CustomFlowLayout {
//                layout.prepareForMove(indexPaths: [(from: IndexPath(item: 5,section: 0), to: IndexPath(item: 1,section: 0))])
//            }
//            UIView.animate(withDuration: 1.5) {
//                self.collectionView.performBatchUpdates({
//                    self.collectionView.moveItem(at: IndexPath(item: 5,section: 0), to: IndexPath(item: 1,section: 0))
//                  
//                }, completion: { _ in
//                    self.collectionView.collectionViewLayout.invalidateLayout() // 强制刷新布局
//                    if let layout = self.collectionView.collectionViewLayout as? CustomFlowLayout {
//                        layout.clearIndexPaths() // 清除所有 index paths 防止重复动画
//                    }
//                    
//                })
//            }
//            
//            data.remove(at: 6)
//            data.insert(num, at: 1)
//            if let layout = collectionView.collectionViewLayout as? CustomFlowLayout {
//                layout.prepareForMove(indexPaths: [(from: IndexPath(item: 6,section: 0), to: IndexPath(item: 1,section: 0))])
//            }
//            UIView.animate(withDuration: 1.5) {
//                self.collectionView.performBatchUpdates({
//                    self.collectionView.moveItem(at: IndexPath(item: 6,section: 0), to: IndexPath(item: 1,section: 0))
//                    // 强制刷新布局
//                    self.collectionView.collectionViewLayout.invalidateLayout()
//                }, completion: { _ in
//                   
//                    if let layout = self.collectionView.collectionViewLayout as? CustomFlowLayout {
//                        layout.clearIndexPaths() // 清除所有 index paths 防止重复动画
//                    }
//                })
//            }
//        }
//        
//    }
//
//    func deleteItemAtIndexPath(_ indexPath: IndexPath) {
//        data.remove(at: indexPath.item) // 从数据源中移除元素（替换相应的代码）
//        if let layout = collectionView.collectionViewLayout as? CustomFlowLayout {
//            layout.prepareForDeletion(indexPaths: [indexPath])
//        }
//        UIView.animate(withDuration: 1.5) {
//            self.collectionView.performBatchUpdates({
//                self.collectionView.deleteItems(at: [indexPath])
//            }, completion: { _ in
//                self.collectionView.collectionViewLayout.invalidateLayout() // 强制刷新布局
//                if let layout = self.collectionView.collectionViewLayout as? CustomFlowLayout {
//                    layout.clearIndexPaths() // 清除所有 index paths 防止重复动画
//                }
//            })
//        }
//    }
//    
//    
//    @objc func handleImage() {
//        let urlString = "http://romefs.yfxn.lzpsap1.com/public/default/067892fd8e28293a5f300be0b9fee2b3/dc7b6f14a2c7719fab4ffdda69d054ba.jpg"
////        let url = URL.init(string: urlString)
//        guard let url = URL(string: urlString) else {
//            print("Invalid URL")
//            return    }
//        let manager = SDWebImageManager.shared
//        
//        let cacheKey = manager.cacheKey(for: url)
//        if let cachedImage = SDImageCache.shared.imageFromMemoryCache(forKey: cacheKey){
//            let resizeImage = resizedImage(image: cachedImage, targetSize: CGSize(width: 50, height: 50))
//            imageView.image = resizeImage
//            print("it has image in cache now")
//        } else {
//            print("image is not in cache, downloading from network")
//            manager.loadImage(with: url, options: [], progress: nil) {[weak self] image, data, error, cacheType, finished, url in
//                guard let self = self else {return}
//                if let image = image {
//                    self.imageView.image = image
//                    print("image has successfully fetched from network or disk cache")
//                } else {
//                    if let error = error {
//                        print("failed to load image \(error.localizedDescription)")
//                    }
//                }
//                
//            }
//        }
//    }
//    
//    func resizedImage(image: UIImage, targetSize: CGSize) -> UIImage? {
//        // 开始图形上下文以重新绘制图像
//        if UIScreen.main.scale == 2.0 {
//                UIGraphicsBeginImageContextWithOptions(targetSize, false, 2.0)
//            } else {
//                UIGraphicsBeginImageContext(targetSize)
//            }
//
//            
//            // 在每种情况上保留注释并使用相同的屏幕比例
//            UIGraphicsBeginImageContextWithOptions(targetSize, false, UIScreen.main.scale)
//            
//            // 绘制改变大小的图片
//            image.draw(in: CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height))
//            
//            // 从当前 context 中获取缩放后的图片
//            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
//            
//            // 结束当前的 context
//            UIGraphicsEndImageContext()
//            
//            // 返回新的改变大小后的图片
//            return scaledImage
//    }
//}
