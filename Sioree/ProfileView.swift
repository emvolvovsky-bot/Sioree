import SwiftUI

struct ProfileView: View {
    private let mockUser = User(
        id: UUID(),
        name: "Sioree Host",
        role: .host,
        city: "New Orleans / NYC",
        badges: [
            Badge(id: UUID(), title: "OG Host", subtitle: "10+ events hosted", iconSystemName: "flame.fill"),
            Badge(id: UUID(), title: "Verified", subtitle: "Trusted by the scene", iconSystemName: "checkmark.seal.fill")
        ],
        eventsAttended: 18
    )

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                header

                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Badges")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)

                        ForEach(mockUser.badges) { badge in
                            BadgeView(badge: badge)
                        }
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Stats")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)

                        HStack {
                            stat("Events Hosted", "\(mockUser.eventsAttended)")
                            Spacer()
                            stat("Followers", "1.2K")
                            Spacer()
                            stat("Rating", "4.9 ★")
                        }
                    }
                }

                Spacer(minLength: 40)
            }
            .padding(.horizontal, 20)
            .padding(.top, 24)
            .padding(.bottom, 40)
        }
        .sioreeScreenBackground()
    }

    private var header: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(AppTheme.Gradients.hero)
                    .frame(width: 110, height: 110)
                    .blur(radius: 16)

                Circle()
                    .strokeBorder(Color.white.opacity(0.3), lineWidth: 2)
                    .background(Circle().fill(Color.black.opacity(0.4)))
                    .frame(width: 90, height: 90)
                    .overlay(
                        Image(systemName: "person.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                    )
            }

            Text(mockUser.name)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.white)

            Text("\(mockUser.city) • \(mockUser.role.rawValue.capitalized)")
                .font(.system(size: 13))
                .foregroundColor(AppTheme.Colors.mutedText)

            Button("Edit profile") { }
                .sioreeGhost()
        }
    }

    private func stat(_ title: String, _ value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(value)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
            Text(title)
                .font(.system(size: 11))
                .foregroundColor(AppTheme.Colors.mutedText)
        }
    }
}
