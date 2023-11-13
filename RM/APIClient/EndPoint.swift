//
//  EndPoint.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//

import Foundation

struct EndPoint {
    var path: String
}

extension EndPoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "rickandmortyapi.com"
        components.path = "/api/" + path
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        return url
    }
}

extension EndPoint {
    static var episode: Self {
        EndPoint(path: "episode")
    }
    
    static func character(withID id: String) -> Self {
        EndPoint(path: "character/\(id)")
    }
    
    static func avatar(withID id: String) -> Self {
        EndPoint(path: "character/avatar/\(id).jpeg")
    }
}
