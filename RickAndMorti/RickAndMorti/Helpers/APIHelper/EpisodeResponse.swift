//
//  EpisodeResponse.swift
//  RickAndMorti
//
//  Created by Кирилл Зезюков on 18.07.2024.
//

import Foundation

struct EpisodeResponse: Codable {
    let info: Info
    let results: [Episode]
}
