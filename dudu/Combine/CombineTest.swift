//
//  CombineTest.swift
//  dudu
//
//  Created by dd_luliluli on 2025/3/18.
//

import Combine

// 假设 User 是您的模型
public struct User: Decodable {
    let id: Int
    let name: String
}

private var cancellables = Set<AnyCancellable>() // 定义一个消耗变量来存储订阅

public class CombineNetwork {
    public static var info = CombineNetwork()
    
    func fetchUser() -> AnyPublisher<User, Error> {
        guard let url = URL(string: "https://api.example.com/user/1") else {
            return Fail(error: NSError(domain: "", code: 400, userInfo: nil)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: User.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}


public extension CoCoCombineKit where Base: CombineNetwork {
    
    func fetchUser() -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            self.object.fetchUser()
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        promise(.success(())) // 完成时返回成功
                    case .failure(let error):
                        promise(.failure(error)) // 发生错误时返回错误
                    }
                }, receiveValue: { user in
                    // 这里可以处理用户数据，例如更新某个状态或发出通知
                    print("Fetched user: \(user)") // 仅作为示例，您可以在这里处理 `user`
                })
                .store(in: &cancellables) // 需要一个 Set<AnyCancellable> 来存储取消的订阅项
        }
        .eraseToAnyPublisher() // 最终返回 AnyPublisher<Void, Error>
    }
}


