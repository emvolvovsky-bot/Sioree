import SwiftUI

struct AppTheme {
    struct Colors {
        static let background = Color(red: 0.96, green: 0.96, blue: 0.96)      // #F5F5F5
        static let backgroundSoft = Color(red: 0.93, green: 0.93, blue: 0.95)  // whisper grey
        static let surface = Color.white
        static let surfaceMuted = Color(red: 0.91, green: 0.92, blue: 0.94)

        static let charcoal = Color(red: 0.12, green: 0.12, blue: 0.12)        // #1E1E1E
        static let graphite = Color(red: 0.18, green: 0.18, blue: 0.18)
        static let strongText = charcoal
        static let mutedText = Color(red: 0.36, green: 0.36, blue: 0.38)

        static let border = Color.black.opacity(0.08)
        static let borderBold = Color.black.opacity(0.14)

        static let accent = Color(red: 0.69, green: 0.87, blue: 1.0)           // icy blue
        static let accentWarm = Color(red: 1.0, green: 0.82, blue: 0.65)       // warm glow
        static let neon = Color(red: 0.80, green: 0.95, blue: 1.0)
    }

    struct Gradients {
        static let hero = halo

        static let halo = LinearGradient(
            colors: [
                Colors.accent.opacity(0.95),
                Colors.accentWarm.opacity(0.55)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )

        static let page = LinearGradient(
            colors: [
                Colors.background,
                Colors.backgroundSoft
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )

        static let cardSheen = LinearGradient(
            colors: [
                Color.white.opacity(0.92),
                Color.white.opacity(0.55)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    struct Radii {
        static let card: CGFloat = 26
        static let pill: CGFloat = 16
        static let tile: CGFloat = 20
    }

    struct Shadows {
        static let glow = ShadowStyle(
            color: Colors.accent.opacity(0.45),
            radius: 30,
            x: 0,
            y: 18
        )

        static let soft = ShadowStyle(
            color: Color.black.opacity(0.08),
            radius: 18,
            x: 0,
            y: 12
        )
    }

    struct ShadowStyle {
        let color: Color
        let radius: CGFloat
        let x: CGFloat
        let y: CGFloat
    }
}
