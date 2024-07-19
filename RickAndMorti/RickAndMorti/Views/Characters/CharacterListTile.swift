//
//  CharecterListTile.swift
//  RickAndMorti
//
//  Created by Кирилл Зезюков on 17.07.2024.
//
import Foundation
import SwiftUI

private extension CGFloat {
    static let imageHeight = 84.0
    static let imageWidht = 64.0
    
    static let cornerRadius = 10.0
    
    static let tileHeight = 353.0
}

struct CharacterListTile: View {
    var character: Character
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image.image?
                    .resizable()
                    .frame(width: .imageHeight, height: .imageWidht)
            }
            .clipShape(RoundedRectangle(cornerRadius: .cornerRadius15))
            
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.regular18px)
                    .lineLimit(1)
                HStack {
                    Text(character.status)
                        .font(.semiBold12px)
                        .foregroundStyle(Character.Status(rawValue: character.status)?.getColor() ?? Color.characterStatusUnknown)
                    Text(verbatim: .point)
                        .font(.semiBold12px)
                    Text(character.species)
                        .font(.semiBold12px)
                }
                Text(character.gender)
                    .font(.light12px)
            }
            .foregroundStyle(Color.white)
            .padding(.leading)
            
            Spacer()
        }
        .padding()
        .background(Color.backgroundListTile)
        .clipShape(RoundedRectangle(cornerRadius: .cornerRadius))
        .frame(width: .tileHeight)
    }
}

#Preview {
    let character = ModelCharacter().characters
    return CharacterListTile(character: Character.default)
}
