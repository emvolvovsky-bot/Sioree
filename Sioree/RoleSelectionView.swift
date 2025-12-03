import SwiftUI

struct RoleSelectionView: View {
    @EnvironmentObject var auth: AuthViewModel

    var body: some View {
        VStack(spacing: 24) {
            header
            roleOptions
            Spacer()
            continueButton
        }
        .padding(24)
        .background(AppTheme.Colors.background)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }

    private var header: some View {
        VStack(spacing: 8) {
            Text("Tell us who you are")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)

            Text("This helps us customize your Sioree experience.")
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.7))
                .multilineTextAlignment(.center)
        }
    }

    private var roleOptions: some View {
        VStack(spacing: 16) {
            ForEach(UserRole.allCases) { role in
                RoleOptionButton(
                    title: role.rawValue.capitalized,
                    iconName: icon(for: role),
                    isSelected: auth.selectedRole == role
                ) {
                    auth.selectedRole = role
                }
            }
        }
    }

    private var continueButton: some View {
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

    private func icon(for role: UserRole) -> String {
        switch role {
        case .host: return "house.fill"
        case .partier: return "sparkles"
        case .talent: return "music.mic"
        case .brand: return "briefcase.fill"
        }
    }
}

private struct RoleOptionButton: View {
    let title: String
    let iconName: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: iconName)
                Text(title)
            }
            .font(.system(size: 17, weight: .semibold))
            .foregroundColor(isSelected ? .black : .white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(backgroundView)
            .cornerRadius(16)
        }
    }

    private var backgroundView: some View {
        Group {
            if isSelected {
                AppTheme.Gradients.hero
            } else {
                Color.white.opacity(0.05)
            }
        }
    }
}
