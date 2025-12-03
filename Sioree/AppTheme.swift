import SwiftUI

struct AppTheme {
    struct Colors {
        static let background = Color(red: 0.03, green: 0.03, blue: 0.05)      // near-black
        static let backgroundSoft = Color(red: 0.07, green: 0.07, blue: 0.10)
        static let card = Color(red: 0.10, green: 0.10, blue: 0.14)
        static let border = Color.white.opacity(0.12)

        static let accent = Color(red: 0.42, green: 0.83, blue: 0.98)          // icy blue accent
        static let accentWarm = Color(red: 0.98, green: 0.52, blue: 0.52)      // warm glow option

        static let mutedText = Color.white.opacity(0.6)
        static let strongText = Color.white
    }

    struct Gradients {
        static let hero = LinearGradient(
            colors: [
                Color(red: 0.99, green: 0.53, blue: 0.54).opacity(0.9),
                Color(red: 0.45, green: 0.80, blue: 1.00).opacity(0.9)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )

        static let subtleGlow = LinearGradient(
            colors: [
                Colors.backgroundSoft,
                Color(red: 0.20, green: 0.22, blue: 0.30)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }

    struct Radii {
        static let card: CGFloat = 22
        static let pill: CGFloat = 999
    }

    struct Shadows {
        static let glow = ShadowStyle(
            color: Colors.accent.opacity(0.6),
            radius: 18,
            x: 0,
            y: 10
        )
    }

    struct ShadowStyle {
        let color: Color
        let radius: CGFloat
        let x: CGFloat
        let y: CGFloat
    }
}
