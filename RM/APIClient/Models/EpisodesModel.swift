//
//  EpisodesModel.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//

import Foundation

struct EpisodeModel: Decodable {
    let results: [Episode]
}

struct Episode: Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
