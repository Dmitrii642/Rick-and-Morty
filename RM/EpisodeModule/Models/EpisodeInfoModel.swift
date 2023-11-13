//
//  EpisodeInfoModel.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//

import UIKit

struct EpisodeInfoModel {
    var id: Int = 0
    var episodeName: String = ""
    var episodeCode: String = ""
    var characterName: String = ""
    var characterSpecies: String = ""
    var characterImage: UIImage?
    var characterGender: String = ""
    var characterStatus: String = ""
    var characterOrigin: String = ""
    var characterType: String = ""
    var characterLocation: String = ""
    var favourites: Bool = false
}

