//
//  CustomBackButton.swift
//  RickAndMorti
//
//  Created by Кирилл Зезюков on 18.07.2024.
//

import SwiftUI

struct CustomBackButton: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack {}
            .navigationBarBackButtonHidden(true)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(.backButtonIcon)
                    })
                }
            })
    }
}

#Preview {
    CustomBackButton()
}
