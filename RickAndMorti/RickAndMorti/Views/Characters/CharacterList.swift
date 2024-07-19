//
//  CharecterList.swift
//  RickAndMorti
//
//  Created by Кирилл Зезюков on 17.07.2024.
//

import SwiftUI

private extension CGFloat {
    static let offset02 = 2.0
    static let offset20 = 20.0
}

struct CharacterList: View {
    @Environment(ModelCharacter.self) var modelCharacter
    @Environment(ModelEpisode.self) var modelEpisode
    @State var searchResponse = ""
    
    var characters: [Character] {
        modelCharacter.characters
    }
    
    var episodes: [Episode] {
        modelEpisode.episodes
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchResponse, action: modelCharacter.search(with: searchResponse))
                    .padding()
                List(characters) { character in
                    CharacterListTile(character: character)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: .offset02, leading: .offset20, bottom: .offset02, trailing: .offset20))
                        .overlay(
                            NavigationLink("",
                                           destination: CharacterDetail(episodes: modelEpisode.getEpisodes(characterEpisodes: character.episode), character: character))
                            .opacity(0)
                        )
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(verbatim: .mainTitle)
                            .font(.bold24px)
                            .padding(.top)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.inset)
        }
    }
}

#Preview {
    CharacterList()
        .environment(ModelCharacter())
        .environment(ModelEpisode())
}
