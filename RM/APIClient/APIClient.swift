//
//  APIClient.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//

import Foundation

final class Client: APIProtocol {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
}

