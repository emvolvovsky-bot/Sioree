//
//  GlassCard.swift
//  Sioree
//
//  Created by Emil Volvovsky on 12/2/25.
//


import SwiftUI

struct GlassCard<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: AppTheme.Radii.card, style: .continuous)
                    .fill(AppTheme.Colors.surface)
                    .overlay(
                        RoundedRectangle(cornerRadius: AppTheme.Radii.card, style: .continuous)
                            .stroke(AppTheme.Colors.border, lineWidth: 1)
                            .blendMode(.lighten)
                    )
                    .shadow(
                        color: AppTheme.Shadows.soft.color,
                        radius: AppTheme.Shadows.soft.radius,
                        x: AppTheme.Shadows.soft.x,
                        y: AppTheme.Shadows.soft.y
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: AppTheme.Radii.card, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color.white.opacity(0.18),
                                        Color.white.opacity(0.02)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .opacity(0.5)
                    )
            )
    }
}
