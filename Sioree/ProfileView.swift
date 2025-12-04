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

    private let marketplaceHighlights = [
        "Peer-to-peer rentals & teams",
        "DJ + vendor listings with reviews",
        "Stripe/PayPal payouts enabled",
        "Map-based discovery toggle"
    ]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                header

                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Badges")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(AppTheme.Colors.charcoal)

                        ForEach(mockUser.badges) { badge in
                            BadgeView(badge: badge)
                        }
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Stats")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(AppTheme.Colors.charcoal)

                        HStack {
                            stat("Events hosted", "\(mockUser.eventsAttended)")
                            Spacer()
                            stat("Followers", "1.2K")
                            Spacer()
                            stat("Rating", "4.9 ★")
                        }
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Marketplace reach")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(AppTheme.Colors.charcoal)

                        WrapHStack(data: marketplaceHighlights, spacing: 10, lineSpacing: 10) { point in
                            Text(point)
                                .font(.system(size: 11, weight: .medium))
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(AppTheme.Colors.surfaceMuted)
                                .cornerRadius(AppTheme.Radii.pill)
                                .foregroundColor(AppTheme.Colors.charcoal)
                        }
                    }
                }

                Spacer(minLength: 40)
            }
            .padding(.horizontal, 24)
            .padding(.top, 32)
            .padding(.bottom, 60)
        }
        .sioreeScreenBackground()
    }

    private var header: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .top, spacing: 16) {
                    Circle()
                        .fill(AppTheme.Gradients.halo)
                        .frame(width: 90, height: 90)
                        .overlay(
                            Image(systemName: "person.fill")
                                .font(.system(size: 36, weight: .semibold))
                                .foregroundColor(AppTheme.Colors.charcoal)
                        )

                    VStack(alignment: .leading, spacing: 6) {
                        Text(mockUser.name)
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(AppTheme.Colors.charcoal)
                        Text("\(mockUser.city) • \(mockUser.role.rawValue.capitalized)")
                            .font(.system(size: 13))
                            .foregroundColor(AppTheme.Colors.mutedText)
                    }

                    Spacer()
                }

                Button("Edit profile") { }
                    .buttonStyle(SioreeButtonStyle(isGhost: true, fullWidth: false))
            }
        }
    }

    private func stat(_ title: String, _ value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(value)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(AppTheme.Colors.charcoal)
            Text(title)
                .font(.system(size: 11))
                .foregroundColor(AppTheme.Colors.mutedText)
        }
    }
}
