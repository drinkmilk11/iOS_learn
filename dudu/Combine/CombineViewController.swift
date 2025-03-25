//
//  CombineViewController.swift
//  dudu
//
//  Created by dd_luliluli on 2025/3/18.
//

import UIKit
import Combine


class CombineViewController: UIViewController {
    
    // Combine 订阅管理
    private var cancellables = Set<AnyCancellable>()
    
    // UI 元素
    private let fetchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Fetch User", for: .normal)
        button.addTarget(CombineViewController.self, action: #selector(fetchUserData), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    // UI 布局
    private func setupUI() {
        view.addSubview(fetchButton)
        fetchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fetchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fetchButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            fetchButton.widthAnchor.constraint(equalToConstant: 200),
            fetchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // 按钮点击事件处理
    @objc private func fetchUserData() {
        let network = CombineNetwork()

        network.fetchUser()
            .receive(on: DispatchQueue.main) // 确保在主线程更新 UI
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        print("请求完成")
                    case .failure(let error):
                        print("请求失败: \(error)")
                    }
                },
                receiveValue: { user in
                    print("获取用户数据: \(user)")
                    // 这里可以添加 UI 更新逻辑（如显示用户信息）
                }
            )
            .store(in: &cancellables) // 保存订阅以管理生命周期
    }
}
