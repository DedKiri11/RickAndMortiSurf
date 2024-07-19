//
//  RickAndMortiApp.swift
//  RickAndMorti
//
//  Created by Кирилл Зезюков on 17.07.2024.
//

import SwiftUI

@main
struct RickAndMortiApp: App {
    @State private var modelCharacter = ModelCharacter()
    @State private var modelEpisode = ModelEpisode()
    
    var body: some Scene {
        WindowGroup {
            ViewCoordinator()
        }
        
    }
    
}
