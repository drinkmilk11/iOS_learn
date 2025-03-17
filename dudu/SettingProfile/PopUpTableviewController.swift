import UIKit
import SnapKit

class PopUpTableviewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let containerView = UIView()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        
        // 设置数据源和代理
        tableView.dataSource = self
        tableView.delegate = self

        // 模拟缩小的操作
        shrinkContainerViewAndHeader()
    }

    func setupViews() {
        view.addSubview(containerView)
        containerView.backgroundColor = .red
        containerView.addSubview(tableView)

        // 设置 tableView 的 tableHeaderView
        let headerView = UIView()
        headerView.backgroundColor = .blue
        headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200)
        tableView.tableHeaderView = headerView
    }

    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(600)  // 假设初始高度为 600
        }

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        self.view.layoutIfNeeded()
    }

    func shrinkContainerViewAndHeader() {
        UIView.animate(withDuration: 10.0) {
            self.containerView.snp.updateConstraints { make in
                make.height.equalTo(450) // 改成新高度
            }

            if let headerView = self.tableView.tableHeaderView {
                let newHeight: CGFloat = 50 // 新的 header 高度

                // 更新 header 的 frame
                headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: newHeight)

                // 重新设置调整后的 headerView 给tableView
                self.tableView.tableHeaderView = headerView
            }
            
            self.view.layoutIfNeeded()
        }
    }

    // MARK: - UITableViewDataSource Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20 // 示例行数
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        cell?.textLabel?.text = "Row \(indexPath.row + 1)" // 示例填充文本
        return cell!
    }

    // MARK: - UITableViewDelegate Methods

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0 // 标准行高
    }
}
