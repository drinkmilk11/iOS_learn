import UIKit
import SDWebImage

class ExampleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate {
    private var adjustableView: UIView!
    private var tableView: UITableView!
    private var data: [String] = []
    
    
    private lazy var gesture: UIPanGestureRecognizer = {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        return panGesture
    }()
    
    private var isScrollViewGesturing: Bool = false
    
    // Configuration
    private let maxHeightPosition: CGFloat = 200
    private let minHeightPosition: CGFloat = 600
    var initialY: CGFloat = 600
    var initialHeight: CGFloat = 200.0
    
    let maxHeight: CGFloat = 700.0
    let minHeight: CGFloat = 200.0
    
    private lazy var navigationView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = false
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Share to"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize adjustableView
        
        adjustableView = UIView(frame: CGRect(x: 50, y: initialY, width: 200, height: initialHeight))
        adjustableView.backgroundColor = .lightGray
        self.view.addSubview(adjustableView)
        

        adjustableView.addGestureRecognizer(gesture)
        gesture.delegate = self
        // Create and initialize TableView
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        adjustableView.addSubview(tableView)
        
        navigationView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        adjustableView.addSubview(navigationView)
        navigationView.snp.makeConstraints { make in
            make.height.equalTo(64)
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.bottom)
            make.height.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        adjustableView.backgroundColor = UIColor.red

        // Initialize data source
        data = (1...20).map { "Item \($0)" }
        
    }
    
    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
           guard gesture.isEnabled else { return }
        print("\(gesture.state)   miaomiaomiao  handle")
//        if tableView.contentOffset.y > 0 {
//            return
//        } else {
//            let translation = gesture.translation(in: self.view)
//            if tableView.isScrollEnabled  && translation.y > 0 {
//                tableView.isScrollEnabled = false
//            }
//        }
           switch gesture.state {
           case .changed:
               let translation = gesture.translation(in: self.view)
               let newHeight = adjustableView.frame.height - translation.y
               let newY = adjustableView.frame.origin.y + translation.y
               tableView.isScrollEnabled = true
               // 更新 frame 但限制在最大和最小高度内
               if newHeight <= maxHeight && newHeight >= minHeight {
                   adjustableView.frame = CGRect(
                       x: adjustableView.frame.origin.x,
                       y: newY,
                       width: adjustableView.frame.width,
                       height: newHeight
                   )
               }
//               if newHeight < minHeight {
//                   tableView.isScrollEnabled = false
//               }
//               
               gesture.setTranslation(.zero, in: self.view)
               
           case .ended:
               let currentHeight = adjustableView.frame.height
               var targetHeight: CGFloat
               var targetY: CGFloat
               
               // 决定要吸附到哪个高度
               let midHeight = (maxHeight + minHeight) / 2
               if currentHeight >= midHeight {
                   targetHeight = maxHeight
                   targetY = initialY - (maxHeight - initialHeight)
               } else {
                   targetHeight = minHeight
                   targetY = initialY
               }
                   
               UIView.animate(withDuration: 0.3) {
                   self.adjustableView.frame = CGRect(
                       x: self.adjustableView.frame.origin.x,
                       y: targetY,
                       width: self.adjustableView.frame.width,
                       height: targetHeight
                   )
                   // 在这里可以根据需求控制 tableView 的滚动
//                   self.tableView.isScrollEnabled = targetHeight == self.maxHeight
               }

           default:
               break
           }
       }

    
    // UITableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("\(scrollView.panGestureRecognizer.state)   miaomiaomiao")
//        scrollView.contentOffset = .zero
//        if scrollView.contentOffset.y > 0 && tableView.contentOffset.y <= 0 {
//            
//        }
        
//        if scrollView.contentOffset.y <= 0 {
////            handlePanGesture(scrollView.panGestureRecognizer)
//            scrollView.contentOffset = .zero
//            self.isScrollViewGesturing = true
////            scrollView.contentOffset = .zero
//        } //else {
//            if isScrollViewGesturing {
//                scrollView.contentOffset = .zero
//            }
//        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("\(scrollView.panGestureRecognizer.state)   miaomiaomiao")
        scrollView.contentOffset = .zero
//        self.isScrollViewGesturing = false
//        if !decelerate && self.gesture.isEnabled {
//            handlePanGesture(scrollView.panGestureRecognizer)
//        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        // 允许同时识别多个手势
        return false
    }

}

//MARK: ---HandleImage------
extension ExampleViewController {
    
   
}
