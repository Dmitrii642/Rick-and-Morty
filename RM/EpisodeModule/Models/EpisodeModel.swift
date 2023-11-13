//
//  EpisodeModel.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//

import UIKit

final class EpisodesModel {
    
    private let episodesViewController: EpisodesViewController
    private let client = Client()

    private var episodesInfo = [EpisodeInfoModel]()
   
    init(viewController: EpisodesViewController) {
        self.episodesViewController = viewController
    }
    
    func fetchData() {
        Task {
            let episodesModels = try await fetchEpisodes().results.compactMap { $0 }
            episodesInfo = .init(repeating: EpisodeInfoModel(), count: episodesModels.count)

            for index in 0..<episodesModels.count {
                episodesInfo[index].episodeName = episodesModels[index].name
                episodesInfo[index].episodeCode = episodesModels[index].episode
                
                let randomId = getRandomCharacter(episodesModels[index].characters)
                let character = try await fetchCharacters(id: randomId)
                episodesInfo[index].id = character.id
                episodesInfo[index].characterName = character.name
                episodesInfo[index].characterSpecies = character.species
                
                episodesInfo[index].characterGender = character.gender
                episodesInfo[index].characterStatus = character.status
                episodesInfo[index].characterOrigin = character.origin.name
                episodesInfo[index].characterType = character.type
                episodesInfo[index].characterLocation = character.location.name

                let avatar = try await client.fetchImage(id: randomId)
                episodesInfo[index].characterImage = avatar
            }
            await episodesViewController.setEpisodesInfo(episodesInfo)
        }
    }
    
    func selectFavouriteCharacter(_ id: Int) {
        for i in 0..<episodesInfo.count {
            if episodesInfo[i].id == id {
                episodesInfo[i].favourites = !episodesInfo[i].favourites
            }
        }
        episodesViewController.setEpisodesInfo(episodesInfo)
        let favouritesCharacters = chooseFavouritesCharacters()
        episodesViewController.updateFavouritesViewController(array: favouritesCharacters)
    }
    
    func chooseFavouritesCharacters() -> [EpisodeInfoModel] {
        episodesInfo.filter { $0.favourites == true }
    }

    private func fetchEpisodes() async throws -> EpisodeModel {
        try await client.fetchModel(type: EpisodeModel.self, with: .episode)
    }
    
    private func fetchCharacters(id: String) async throws -> CharacterModel {
        try await client.fetchModel(type: CharacterModel.self, with: .character(withID: id))
    }

    private func getRandomCharacter(_ characters: [String]) -> String {
        var charactersId = [String]()
        characters.forEach { char in
            let currentId = char.components(separatedBy: "/").last
            charactersId.append(currentId ?? "")
        }
        return charactersId.randomElement() ?? ""
    }
}
