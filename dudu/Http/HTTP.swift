//
//  HTTP.swift
//  dudu
//
//  Created by dd_luliluli on 2024/9/23.
//

import UIKit
import Foundation

enum HTTP {
    
    struct GET {
        
        /// Async GET request
        /// - Parameters:
        ///   - url: request url
        ///   - timeout: request timeout
        ///   - head: request head field
        ///   - completionHandler: request callback
        /// - Returns: none
        static func async(_ url: URL,
                          parameters: [String: String] = [:],
                          head: [String: String] = [:],
                          timeout: Int = 20000,
                          completionHandler: @escaping (Result<Data,Error>) -> ()) {
            var urlRecevied = url
            
            if var components = URLComponents(url: urlRecevied, resolvingAgainstBaseURL: false) {
                components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value)}
                urlRecevied = components.url ?? url
            }
            
            var request = URLRequest(url: urlRecevied, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: TimeInterval(timeout / 1000))
            
            head.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
            
            URLSession.shared.dataTask(with: request) {(data, response, error) in
                    
                let result: Result<Data, Error>
                if let errorGet = error {
                    result = .failure(errorGet)
                } else if let dataGet = data {
                    result = .success(dataGet)
                } else {
                    let errorGet = NSError(domain: #function, code: -10000, userInfo: ["errMsg": "Request \(url.absoluteString) error, response: \(response?.description ?? "")"])
                    result = .failure(errorGet)
                }
                
                completionHandler(result)
            }.resume()
            
        }
        
    }
    
    struct POST {
        
        static func async(_ url: URL,
                          parameters: [String: String] = [:],
                          head: [String: String] = [:],
                          timeout: Int = 8000,
                          completionHandler: @escaping (Result<Data, Error>) -> ()) {
            var requsetGet = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: TimeInterval(timeout / 1000))
            requsetGet.httpMethod = "POST"
            
            head.forEach{ requsetGet.addValue($0.value, forHTTPHeaderField: $0.key)}
            
//            requsetGet = prepare
            
        }
    }
}

