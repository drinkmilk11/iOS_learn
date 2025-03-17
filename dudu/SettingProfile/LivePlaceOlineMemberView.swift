//
//  LivePlaceOlineMemberView.swift
//  dudu
//
//  Created by dd_luliluli on 2024/12/26.
//

import UIKit
import SnapKit

class LivePlaceOlineMemberView: UIView {
    
    private var itemRadius: CGFloat = 20.0 //头像圆圈半价大小
    private var gapRadius: CGFloat = 4.0 //为中间间隔圆弧大小
    private var itemMaxNum: Int = 5
    
    private var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
        addSubview(contentView)
    }
    
    private func layoutView() {
        contentView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(itemRadius * 2.0)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    func setImage() {
        var originX = 0.0
        
        for _ in 0..<itemMaxNum {
            let itemView = createItemView()
            itemView.frame.origin = CGPoint(x: originX, y: itemView.frame.origin.y)
            contentView.addSubview(itemView)
            originX = originX + 2.0 * itemRadius - gapRadius
        }
        contentView.backgroundColor = .purple
        contentView.snp.remakeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(itemRadius * 2.0)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(originX + gapRadius)
        }
        
    }
    
    private func createItemView(url: String? = nil, image: UIImage? = nil, lakealpha: CGFloat = 1.0) -> UIView {
        let itemWidth = 2.0 * itemRadius + gapRadius
        let itemHeight = 2.0 * itemRadius + gapRadius
        let bgView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: itemWidth, height: itemHeight))
        
        bgView.backgroundColor = .clear
        bgView.layer.cornerRadius = itemWidth / 2
        
        let lakeMoonView = UIImageView.init(frame: CGRect.init(x: 0 - gapRadius, y: 0 - gapRadius, width: itemWidth, height: itemWidth))
        lakeMoonView.image = UIImage(named: "lake_moon")
        lakeMoonView.layer.cornerRadius = itemWidth / 2
        lakeMoonView.alpha = lakealpha
        bgView.addSubview(lakeMoonView)
        
        guard let originalImage = UIImage(named: "maomi") else {
            return bgView
        }
        let targetSize = CGSize(width: itemRadius * 2, height: itemRadius * 2)
        guard let resizedImage = resizedImage(image: originalImage, targetSize: targetSize) else {
            return bgView
        }
        
        // 计算透明孔的位置和大小
        let holeRadius: CGFloat = itemRadius + gapRadius// 选择合适的孔径大小
        let holeCenter = CGPoint(x: 3.0 * itemRadius - gapRadius, y: itemRadius)
        
        let holeRect = CGRect(
            x: holeCenter.x - holeRadius,
            y: holeCenter.y - holeRadius,
            width: holeRadius * 2,
            height: holeRadius * 2
        )
        
        if let imageWithHole = createImageWithTransparentHole(originalImage: resizedImage, holeRect: holeRect) {
            // 创建 UIImageView
            let imageView = UIImageView(image: imageWithHole)
            imageView.contentMode = .scaleAspectFit
            
            imageView.layer.cornerRadius = itemRadius
            imageView.clipsToBounds = true
            bgView.addSubview(imageView)
        }
        return bgView
        
    }
    
    func createImageWithTransparentHole(originalImage: UIImage, holeRect: CGRect) -> UIImage? {
        // 创建图形上下文
        UIGraphicsBeginImageContextWithOptions(originalImage.size, false, originalImage.scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        // 绘制原始图像
        originalImage.draw(in: CGRect(origin: .zero, size: originalImage.size))
        
        // 设置混合模式为 clear
        context.setBlendMode(.clear)
        
        // 创建并填充用于透明孔的路径
        let path = UIBezierPath(ovalIn: holeRect)
        path.fill()
        
        // 从上下文获取处理后的新图像
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // 结束图形上下文
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func resizedImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        // 开始图形上下文以重新绘制图像
        UIGraphicsBeginImageContextWithOptions(targetSize, false, image.scale)
        image.draw(in: CGRect(origin: .zero, size: targetSize))
        
        // 从上下文中获取调整后的图像
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
}
