//
//  APIGeneric.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//

import UIKit

protocol APIProtocol {
    var session: URLSession { get }
    func fetchModel<T: Decodable>(type: T.Type, with endPoint: EndPoint) async throws -> T
    func fetchImage(id: String) async throws -> UIImage
}

extension APIProtocol {
    func fetchModel<T: Decodable>(type: T.Type, with endPoint: EndPoint) async throws -> T {
        
        let (data, response) = try await session.data(from: endPoint.url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.requestFailed(description: "Invalid response")
        }
        
        guard httpResponse.statusCode == 200 else {
            throw ApiError.responseUnsuccessful(description: "Status code: \(httpResponse.statusCode)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(type, from: data)
        } catch {
            throw ApiError.jsonConversionFailure(description: error.localizedDescription)
        }
    }
    
    func fetchImage(id: String) async throws -> UIImage {
        let (data, _) = try await session.data(from: EndPoint.avatar(withID: id).url)
        
        guard let image = UIImage(data: data) else {
            throw ApiError.invalidData
        }
        return image
    }
}
