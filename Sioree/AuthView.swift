import SwiftUI

struct AuthView: View {
    @EnvironmentObject var auth: AuthViewModel

    var body: some View {
        VStack(spacing: 28) {

            Spacer()

            // MARK: - Logo + tagline
            VStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(AppTheme.Gradients.hero)
                        .frame(width: 120, height: 120)
                        .blur(radius: 14)

                    Image(systemName: "record.circle.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(.white)
                }

                Text("Sioree")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(.white)

                Text("Organize chaos. Scale it beautifully.")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(AppTheme.Colors.mutedText)
            }

            Spacer(minLength: 12)

            // MARK: - Buttons
            VStack(spacing: 12) {

                // SIGN UP BUTTON
                NavigationLink(destination: RoleSelectionView()) {
                    Text("Sign Up")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            AppTheme.Gradients.hero
                                .cornerRadius(20)
                        )
                }

                NavigationLink(destination: SignInView()) {
                    Text("I already have an account")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(AppTheme.Colors.accent)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(
                            RoundedRectangle(cornerRadius: 18, style: .continuous)
                                .fill(Color.white.opacity(0.05))
                        )
                }

                // GHOST BUTTON
                Button("Continue as Guest") {
                    auth.continueAsGuest()
                }
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.4), lineWidth: 1)
                )
            }

            Text("By continuing, you agree to our Terms and Privacy Policy.")
                .font(.system(size: 11))
                .foregroundColor(AppTheme.Colors.mutedText)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)

            Spacer(minLength: 24)
        }
        .padding(.top, 60)
        .padding(.bottom, 32)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppTheme.Colors.background)
        .ignoresSafeArea()
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AuthView()
                .environmentObject(AuthViewModel())
        }
    }
}
