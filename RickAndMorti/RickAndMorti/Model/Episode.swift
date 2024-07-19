//
//  Episode.swift
//  RickAndMorti
//
//  Created by Кирилл Зезюков on 18.07.2024.
//

import Foundation


struct Episode: Codable, Identifiable, Hashable {
    var id: Int
    var name: String
    var url: String
}
