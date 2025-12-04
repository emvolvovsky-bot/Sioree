import SwiftUI

struct RoleSelectionView: View {
    @EnvironmentObject var auth: AuthViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                Text("Choose your lane")
                    .font(.system(size: 28, weight: .heavy))
                    .foregroundColor(AppTheme.Colors.charcoal)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("We tailor flows for hosts, partiers, talent, and brand collaborators so the marketplace feels native immediately.")
                    .font(.system(size: 14))
                    .foregroundColor(AppTheme.Colors.mutedText)
                    .frame(maxWidth: .infinity, alignment: .leading)

                ForEach(UserRole.allCases) { role in
                    Button {
                        auth.selectedRole = role
                    } label: {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text(role.rawValue.capitalized)
                                    .font(.system(size: 18, weight: .semibold))
                                Spacer()
                                Image(systemName: icon(for: role))
                            }
                            .foregroundColor(AppTheme.Colors.charcoal)

                            Text(copy(for: role))
                                .font(.system(size: 13))
                                .foregroundColor(AppTheme.Colors.mutedText)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: AppTheme.Radii.card, style: .continuous)
                                .fill(AppTheme.Colors.surface)
                                .overlay(
                                    RoundedRectangle(cornerRadius: AppTheme.Radii.card)
                                        .stroke(auth.selectedRole == role ? AppTheme.Colors.charcoal : AppTheme.Colors.border, lineWidth: 1.2)
                                )
                                .shadow(color: auth.selectedRole == role ? AppTheme.Colors.borderBold : Color.clear, radius: 18, x: 0, y: 10)
                        )
                    }
                    .buttonStyle(.plain)
                }

                NavigationLink(destination: OnboardingQuestionsView()) {
                    Text("Continue")
                }
                .sioreePrimary()
                .disabled(auth.selectedRole == nil)
                .opacity(auth.selectedRole == nil ? 0.4 : 1)
            }
            .padding(.horizontal, 24)
            .padding(.top, 32)
            .padding(.bottom, 60)
        }
        .sioreeScreenBackground()
        .navigationBarTitleDisplayMode(.inline)
    }

    private func icon(for role: UserRole) -> String {
        switch role {
        case .host: return "house.fill"
        case .partier: return "sparkles"
        case .talent: return "music.mic"
        case .brand: return "briefcase.fill"
        }
    }

    private func copy(for role: UserRole) -> String {
        switch role {
        case .host:
            return "Stand up events, manage teams, view analytics, and enable Stripe / PayPal payouts."
        case .partier:
            return "Browse the home feed, follow hosts or collectives, collect badges, and buy tickets instantly."
        case .talent:
            return "Offer DJ sets, rentals, photography, bartending, or specialty skills with verified reviews."
        case .brand:
            return "Drop sponsored listings, collaboration offers, and measure impact through host dashboards."
        }
    }
}
