//
//  Character.swift
//  RickAndMorti
//
//  Created by Кирилл Зезюков on 17.07.2024.
//

import Foundation
import SwiftUI


struct Location: Codable {
    var name: String
    var url: String
}

struct Character: Codable, Identifiable, Hashable {
    
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Location
    var location: Location
    var image: String
    var episode: [String]
    
    static let `default` = Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", type: "", gender: "Male", origin: Location(name: "Earth", url: "https://rickandmortyapi.com/api/location/1"), location: Location(name: "Earth", url: "https://rickandmortyapi.com/api/location/20"), image:  "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: [
        "https://rickandmortyapi.com/api/episode/1",
        "https://rickandmortyapi.com/api/episode/2",
    ])
    
    enum Status: String {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "Unknown"
        
        func getColor() -> Color {
            switch self {
            case .alive:
                return Color.characterStatusAlive
            case .dead:
                return Color.characterStatusDead
            case .unknown:
                return Color.characterStatusUnknown
            }
        }
        
        static func getValues() -> [String] {
            return [Status.alive.rawValue, Status.dead.rawValue, Status.unknown.rawValue]
        }
    }
    
    enum Gender: String {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown = "Unknown"
        
        
        static func getValues() -> [String] {
            return [Gender.female.rawValue, Gender.male.rawValue, Gender.genderless.rawValue,  Gender.unknown.rawValue]
        }
    }
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
