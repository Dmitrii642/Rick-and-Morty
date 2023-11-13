//
//  APIError.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//

import Foundation

enum ApiError: Error {
    case requestFailed(description: String)
    case invalidData
    case responseUnsuccessful(description: String)
    case jsonConversionFailure(description: String)
}

