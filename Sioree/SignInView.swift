import SwiftUI

struct SignInView: View {
    @EnvironmentObject var auth: AuthViewModel

    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                header
                formFields
                if let errorMessage {
                    Text(errorMessage)
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.red)
                        .transition(.opacity)
                }
                primaryAction
                secondaryActions
            }
            .padding(.vertical, 32)
            .padding(.horizontal, 24)
        }
        .background(AppTheme.Colors.background.ignoresSafeArea())
        .navigationTitle("Sign In")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Welcome back")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)

            Text("Sign in to keep planning unforgettable experiences.")
                .font(.system(size: 15))
                .foregroundColor(AppTheme.Colors.mutedText)
        }
    }

    private var formFields: some View {
        VStack(spacing: 16) {
            AuthInputField(
                title: "Email",
                prompt: "you@example.com",
                systemImage: "envelope",
                text: $email,
                isSecure: false
            )

            AuthInputField(
                title: "Password",
                prompt: "Enter your password",
                systemImage: "lock",
                text: $password,
                isSecure: true
            )
        }
    }

    private var primaryAction: some View {
        Button(action: attemptSignIn) {
            Text("Sign In")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(isFormValid ? .white : .white.opacity(0.6))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    AppTheme.Gradients.hero
                        .cornerRadius(20)
                        .opacity(isFormValid ? 1 : 0.4)
                )
        }
        .disabled(!isFormValid)
    }

    private var secondaryActions: some View {
        VStack(spacing: 12) {
            Button("Forgot password?") {
                // TODO: Wire up recovery flow when backend exists.
            }
            .font(.system(size: 15, weight: .semibold))
            .foregroundColor(AppTheme.Colors.accent)

            Text("Need a Sioree profile? Head back and create one in minutes.")
                .font(.system(size: 13))
                .foregroundColor(AppTheme.Colors.mutedText)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
        }
    }

    private func attemptSignIn() {
        errorMessage = nil

        guard isFormValid else {
            errorMessage = "Enter your email and password."
            return
        }

        auth.signIn(email: email, password: password)
    }

    private var isFormValid: Bool {
        !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

private struct AuthInputField: View {
    let title: String
    let prompt: String
    let systemImage: String
    @Binding var text: String
    let isSecure: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(AppTheme.Colors.mutedText)

            HStack(spacing: 12) {
                Image(systemName: systemImage)
                    .foregroundColor(AppTheme.Colors.mutedText)
                if isSecure {
                    SecureField(prompt, text: $text)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                } else {
                    TextField(prompt, text: $text)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(AppTheme.Colors.card)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(AppTheme.Colors.border)
                    )
            )
        }
    }
}
