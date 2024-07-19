//
//  CharacterResponse.swift
//  RickAndMorti
//
//  Created by Кирилл Зезюков on 18.07.2024.
//

import Foundation

struct CharacterResponse: Codable {
    let info: Info
    let results: [Character]
}
