//
//  CharactersMainTitle.swift
//  RickAndMorti
//
//  Created by Кирилл Зезюков on 18.07.2024.
//

import SwiftUI

struct CharactersMainTitle: View {
    var body: some View {
        HStack {}
            .background(Color.black)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(verbatim: .mainTitle)
                        .font(.bold24px)
                }
            }
    }
}

#Preview {
    CharactersMainTitle()
}
