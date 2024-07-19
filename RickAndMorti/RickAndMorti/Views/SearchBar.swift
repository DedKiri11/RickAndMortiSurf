//
//  SearchBar.swift
//  RickAndMorti
//
//  Created by Кирилл Зезюков on 19.07.2024.
//

import SwiftUI

private extension CGFloat {
    static let stackHeight = 50.0
    static let backgroundOpacity = 0.2
    static let backgroundHeight = 40.0
    static let borderWidth = 2.0
}

struct SearchBar: View {
    @Binding var searchText: String
    var action: Void
    
    var body: some View {
        HStack {
            ZStack {
                HStack {
                    Spacer()
                    Image(.searchIcon)
                        .foregroundColor(.black)
                    TextField(String.search,
                              text: $searchText,
                              onCommit: { action }
                    )
                    .font(.light12px)
                    .foregroundColor(.white)
                    .frame(height: .stackHeight)
                    .textFieldStyle(.plain)
                    .cornerRadius(.cornerRadius15)
                    
                }
                .background(
                    RoundedRectangle(cornerRadius: .cornerRadius15)
                        .fill(.black)
                        .stroke(Color.gray, lineWidth: .borderWidth)
                        .frame(height: .backgroundHeight)
                        .opacity(CGFloat.backgroundOpacity)
                    
                )
                .cornerRadius(.cornerRadius15)
            }
        }
        .frame(height: .stackHeight)
    }
}

