//
//  CharacterModel.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//

import Foundation

struct CharacterModel: Decodable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Decodable {
    let name: String
    let url: String
}


