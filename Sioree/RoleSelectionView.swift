import SwiftUI

struct RoleSelectionView: View {
    @EnvironmentObject var auth: AuthViewModel

    var body: some View {
        VStack(spacing: 24) {
            Text("Tell us who you are")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)

            Text("This helps us customize your Sioree experience.")
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.7))
                .multilineTextAlignment(.center)

            ForEach(UserRole.allCases) { role in
                Button {
                    auth.selectedRole = role
                } label: {
                    HStack {
                        Image(systemName: icon(for: role))
                        Text(role.rawValue.capitalized)
                    }
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(auth.selectedRole == role ? .black : .white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(
                        Group {
                            if auth.selectedRole == role {
                                AppTheme.Gradients.hero
                            } else {
                                Color.white.opacity(0.05)
                            }
                        }
                    )
                    .cornerRadius(16)
                }
            }

            Spacer()

            NavigationLink(destination: OnboardingQuestionsView()) {
                Text("Continue")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(AppTheme.Gradients.hero)
                    .cornerRadius(20)
                    .opacity(auth.selectedRole == nil ? 0.3 : 1)
            }
            .disabled(auth.selectedRole == nil)

        }
        .padding(24)
        .background(AppTheme.Colors.background)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }

    private func icon(for role: UserRole) -> String {
        switch role {
        case .host: return "house.fill"
        case .partier: return "sparkles"
        case .talent: return "music.mic"
        case .brand: return "briefcase.fill"
        }
    }
}
