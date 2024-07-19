//
//  ContentView.swift
//  RickAndMorti
//
//  Created by Кирилл Зезюков on 17.07.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CharacterList()
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(ModelCharacter())
        .environment(ModelEpisode())
}
