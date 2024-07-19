//
//  CharacterDetail.swift
//  RickAndMorti
//
//  Created by Кирилл Зезюков on 18.07.2024.
//

import SwiftUI

private extension CGFloat {
    static let imageHeight = 320.0
    static let imageWidth = 320.0
    static let statusBackgroundWidth = 320.0
    static let statusBackgroundHeight = 42.0
    static let vStackElementsSpacing = 12.0
}

struct CharacterDetail: View {
    @Environment(\.dismiss) var dismiss
    
    var episodes: String
    var character: Character
    
    var body: some View {
        HStack {
            VStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(.backButtonIcon)
                })
            }
            .padding(.leading)
            
            Spacer()
            
            Text(character.name)
                .font(.bold24px)
                .padding(.trailing)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        
        VStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image.image?
                    .resizable()
                    .frame(width: .imageWidth, height: .imageHeight)
            }
            .clipShape(RoundedRectangle(cornerRadius: .cornerRadius15))
            .padding(.bottom)
            Text(character.status)
                .background(
                    RoundedRectangle(cornerRadius: .cornerRadius15)
                        .fill(Character.Status(rawValue: character.status)?.getColor() ?? Color.gray)
                        .frame(width: .statusBackgroundWidth, height: .statusBackgroundHeight)
                )
                .padding(.bottom)
            
            HStack {
                VStack(alignment: .leading, spacing: .vStackElementsSpacing) {
                    Text("Spicies: \(character.species)")
                    Text("Gender: \(character.gender)")
                    Text("Episodes: \(episodes)")
                    Text("Last known location: \(character.location.name)")
                }
                
                Spacer()
                
            }
            .padding()
        }
        .foregroundStyle(Color.white)
        .padding()
        .background(Color.backgroundListTile)
        .clipShape(RoundedRectangle(cornerRadius: .cornerRadius15))
        Spacer()
    }
}


#Preview {
    CharacterDetail(episodes: "", character: Character.default)
}
