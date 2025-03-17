//
//  File.swift
//  dudu
//
//  Created by dd_luliluli on 2024/8/24.
//
import Foundation
import UIKit

struct model {
    let userId: Int64
    let relation: String
//    var cell: 
}

class MumuController: UIViewController {
    
    enum Optional<Wrapped> {
        case one
        case some(Wrapped)
    }
    
    struct student<T> {
        var name: String
        var age: Int
        
        func greet(_ value: T) {
            print("It's good Time for you")
        }
    }
    
    struct Eq<A> {
        let eq:(A, A) -> Bool
    }
    
    var array: [Int] = [1, 2, 3, 4, 5, 6, 7]
    var myCell: duduCollectionViewCell?
    var nunu:Bool = false
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize.init(width: 60, height: 60)
        layout.estimatedItemSize = .zero
        layout.headerReferenceSize = .zero
        layout.footerReferenceSize = .zero
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    private lazy var button: UIButton = {
        let dd = UIButton()
        return dd
    }()
    
    override func viewDidLoad() {
//        GroupManager.shared.weakDelegated.add(self)
        super.viewDidLoad()
        self.view.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.view.backgroundColor = UIColor.black
        self.view.addSubview(collectionView)
        collectionView.backgroundColor =  UIColor.yellow
        collectionView.delegate = self
        collectionView.dataSource = self
//        tapGestureRecognizer.isEnabled = true

        collectionView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-190)
        }
        
        let buttonw = UIButton(type: .system)
        buttonw.setTitle("United States", for: .normal)
               
        // 添加系统自带的箭头图标
        if let chevronImage = UIImage(systemName: "chevron.right") {
            buttonw.setImage(chevronImage, for: .normal)
            buttonw.tintColor = .white // 设置箭头颜色
        }
        buttonw.backgroundColor = .darkGray
        buttonw.layer.cornerRadius = 8
        buttonw.contentHorizontalAlignment = .left
        // 确保图标在文字右边
        buttonw.semanticContentAttribute = .forceRightToLeft
        buttonw.frame = CGRect(x: 20, y: 100, width: 300, height: 50)
        buttonw.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0)
        buttonw.imageEdgeInsets = UIEdgeInsets(top: 0, left: buttonw.frame.width - 30, bottom: 0, right: 0)

        
                
                // 添加按钮到视图
        view.addSubview(buttonw)
        buttonw.snp.makeConstraints { make in
            make.bottom.equalTo(collectionView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().offset(-200)
        }
        
        setUpCollectionView()
        self.view.addSubview(button)
        button.backgroundColor = UIColor.white
        button.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().offset(-200)
        }
        button.addTarget(self, action: #selector(hhuhu), for: .touchUpInside)
//        self.view.pau
        let AA = ZhuZhu()
        AA.text = "AA"
        let BB = ZhuZhu()
        BB.text = "BB"
        let CC = UIButton()
        CC.addTarget(self, action: #selector(labelTapped), for: .touchUpInside)
//        CC.text = "CC"
        AA.backgroundColor = UIColor.blue
        BB.backgroundColor = UIColor.green
        CC.backgroundColor = UIColor.red
        self.view.isUserInteractionEnabled = true
        self.view.addSubview(AA)
        AA.addSubview(BB)
        BB.addSubview(CC)
        AA.frame = CGRect(x: 180, y: 190, width: 90, height: 90)
        BB.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        CC.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        AA.isUserInteractionEnabled = true
//        CC.hitTestEdgeInsets = UIEdgeInsets.init(top: -20, left: -20, bottom: -20, right: -20)
        
        let shinyView = ShinyEffectView(frame: CGRect(x: 50, y: 100, width: 300, height: 300))
        shinyView.backgroundColor = .black
        view.addSubview(shinyView)
    }
    
//    func process<B>(_ input: B) -> String {
//        let formatted = format(input)
//    }
    
    func identity<A>(_ value: A) -> A {
        return value
    }
    
    
    @objc func labelTapped(){
//        GroupManager.shared.notifyAllDelegates()
            print("标签被点击了erttrtrretertertretrte")
    }
    @objc func hhuhu() {
        if nunu == false {
            nunu = true
            
            
           
           
        }
        
       
        
//        self.collectionView.performBatchUpdates {
//            self.collectionView.moveItem(at: IndexPath.init(row: 3, section: 0), to: IndexPath.init(row: 1, section: 0))
//            (self.array[3], self.array[1]) = (self.array[1], self.array[3])
//            self.collectionView.moveItem(at: IndexPath.init(row: 5, section: 0), to: IndexPath.init(row: 0, section: 0))
//            (self.array[5], self.array[0]) = (self.array[0], self.array[5])
//        } completion: { _ in
//            self.collectionView.layoutIfNeeded()
//            self.collectionView.reloadData()
//        }
//        self.collectionView.performBatchUpdates {
//            self.array.remove(at: 0)
//            self.collectionView.deleteItems(at: [IndexPath.init(row: 0, section: 0)])
//            self.collectionView.layoutIfNeeded()
//            self.collectionView.reloadData()
//        } completion: { _ in
//            self.collectionView.layoutIfNeeded()
//            self.collectionView.reloadData()
//        }
//        array.append(1)
//        array.append(9)
       
        self.collectionView.layoutIfNeeded()
        self.collectionView.reloadData()
        print(array)

        

    }
    func setUpCollectionView() {
        let cellIDs = ["CellID1", "CellID2", "CellID3", "CellID4", "CellID5", "CellID6", "CellID7", "CellID8", "CellID9", "CellID10", "CellID11", "CellID12", "CellID13", "CellID14", "CellID15", "CellID16", "CellID17", "CellID18", "CellID19", "CellID20"]
        for cellID in cellIDs {
            collectionView.register(duduCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        }
    }
    
    func setupUI() {
        
    }
    
}

extension MumuController: UICollectionViewDelegate {
    
}

extension MumuController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
        //        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(String(indexPath.row) + "    " + String(array[indexPath.row]))
        if array[indexPath.row] == 1 {
            if myCell != nil {
                myCell?.configure(with: String(array[indexPath.item]), identifier: array[indexPath.item])
                return myCell ?? duduCollectionViewCell()
            }else {
                let cellID = "CellID\(array[indexPath.item])" // 假设每个项目都有一个类型属性
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? duduCollectionViewCell else {
                    let cell = duduCollectionViewCell()
                    print(array[indexPath.item])
                    myCell = cell
                    return cell
                }
                
                cell.configure(with: String(array[indexPath.item]), identifier: array[indexPath.item])
                print("cell = \(cell) , index = \(indexPath.item)")
                myCell = cell
                return cell
            }
        }else {
            let cellID = "CellID\(array[indexPath.item])" // 假设每个项目都有一个类型属性
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? duduCollectionViewCell else {
                let cell = duduCollectionViewCell()
                print(array[indexPath.item])
                return cell
            }
            cell.configure(with: String(array[indexPath.item]), identifier: array[indexPath.item])
            print("cell = \(cell) , index = \(indexPath.item)")
            return cell
        }
        
        
    }
    
    
    
}
//
//extension MumuController: GroupManagerProtocol {
//    func groupInfoUpdate() {
//        print("I'm here, please to confirm")
//    }
//}




