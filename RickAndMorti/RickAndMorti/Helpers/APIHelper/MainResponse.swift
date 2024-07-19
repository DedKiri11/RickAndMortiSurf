//
//  MainResponse.swift
//  RickAndMorti
//
//  Created by Кирилл Зезюков on 18.07.2024.
//

import Foundation

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
