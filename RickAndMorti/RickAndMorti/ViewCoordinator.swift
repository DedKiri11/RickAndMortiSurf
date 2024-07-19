//
//  ViewCoordinator.swift
//  RickAndMorti
//
//  Created by Кирилл Зезюков on 18.07.2024.
//

import SwiftUI

struct ViewCoordinator: View {
    @State private var isActive = false
    @State private var modelCharacter = ModelCharacter()
    @State private var modelEpisode = ModelEpisode()
    var body: some View {
        if isActive {
            ContentView()
                .environment(modelEpisode)
                .environment(modelCharacter)
                .preferredColorScheme(.dark)
            
        }else {
            SplashScreen(isActive: $isActive)
        }
    }
}

#Preview {
    ViewCoordinator()
}
