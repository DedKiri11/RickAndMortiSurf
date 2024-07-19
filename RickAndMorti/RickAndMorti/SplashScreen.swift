//
//  SplashScreen.swift
//  RickAndMorti
//
//  Created by Кирилл Зезюков on 18.07.2024.
//

import SwiftUI

private extension CGFloat {
    static let animationDuration = 0.7
    static let animationDelay = 0.2
}

struct SplashScreen: View {
    @State private var scale = 0.9
    @Binding var isActive: Bool
    var body: some View {
        VStack {
            VStack {
                Image("SplashScreen")
            }.scaleEffect(scale)
                .onAppear{
                    withAnimation(.easeIn(duration: CGFloat.animationDuration)) {
                        self.scale = 1
                    }
                }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + CGFloat.animationDelay) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

