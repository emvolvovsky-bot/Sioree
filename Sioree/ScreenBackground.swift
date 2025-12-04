//
//  ScreenBackground.swift
//  Sioree
//
//  Created by Emil Volvovsky on 12/2/25.
//


import SwiftUI

struct ScreenBackground: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            AppTheme.Gradients.page
                .ignoresSafeArea()

            // Accent aura + subtle noise for the underground feel
            ZStack {
                Circle()
                    .fill(AppTheme.Gradients.halo)
                    .frame(width: 420, height: 420)
                    .blur(radius: 140)
                    .opacity(0.45)
                    .offset(x: -160, y: -260)

                Circle()
                    .fill(AppTheme.Colors.accentWarm.opacity(0.35))
                    .frame(width: 320, height: 320)
                    .blur(radius: 120)
                    .offset(x: 140, y: 260)

                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.04),
                                Color.black.opacity(0.04)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .blendMode(.softLight)
                    .opacity(0.7)
            }
            .allowsHitTesting(false)

            content
        }
    }
}

extension View {
    func sioreeScreenBackground() -> some View {
        modifier(ScreenBackground())
    }
}
