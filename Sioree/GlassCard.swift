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
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: AppTheme.Radii.card, style: .continuous)
                    .fill(Color.white.opacity(0.04))
                    .background(
                        RoundedRectangle(cornerRadius: AppTheme.Radii.card, style: .continuous)
                            .stroke(AppTheme.Colors.border, lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.6), radius: 20, x: 0, y: 16)
            )
    }
}
