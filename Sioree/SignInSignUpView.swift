import SwiftUI
import UIKit

struct SignInSignUpView: View {
    enum Mode: String, CaseIterable {
        case signIn = "Sign In"
        case signUp = "Sign Up"

        var subtitle: String {
            switch self {
            case .signIn:
                return "Welcome back. Pick up where you left off."
            case .signUp:
                return "Create your Sioree profile in a few quick steps."
            }
        }
    }

    private enum Field: Hashable {
        case name, email, password, confirmPassword
    }

    @EnvironmentObject private var auth: AuthViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var mode: Mode
    @State private var displayName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var validationMessage: String? = nil
    @FocusState private var focusedField: Field?

    init(initialMode: Mode = .signIn) {
        _mode = State(initialValue: initialMode)
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                header
                modeSelector
                formFields

                if let validationMessage {
                    Text(validationMessage)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.red.opacity(0.85))
                        .transition(.opacity)
                }

                Button(action: handleSubmit) {
                    Text(mode == .signIn ? "Sign In" : "Create Account")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(AppTheme.Gradients.hero)
                        .cornerRadius(20)
                }
                .padding(.top, 8)

                togglePrompt
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 32)
        }
        .background(AppTheme.Colors.background.ignoresSafeArea())
        .navigationTitle(mode == .signIn ? "Already have an account?" : "Create a Sioree account")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Close") {
                    dismiss()
                }
                .foregroundColor(AppTheme.Colors.mutedText)
            }
        }
    }

    // MARK: - Subviews

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(mode.rawValue)
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundColor(.white)

            Text(mode.subtitle)
                .font(.system(size: 15))
                .foregroundColor(AppTheme.Colors.mutedText)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var modeSelector: some View {
        HStack(spacing: 12) {
            ForEach(Mode.allCases, id: \.self) { option in
                Button {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                        switchMode(option)
                    }
                } label: {
                    Text(option.rawValue)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(option == mode ? .black : AppTheme.Colors.mutedText)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(
                            Group {
                                if option == mode {
                                    LinearGradient(colors: [Color.white, Color.white.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing)
                                } else {
                                    Color.white.opacity(0.05)
                                }
                            }
                        )
                        .cornerRadius(16)
                }
            }
        }
    }

    @ViewBuilder
    private var formFields: some View {
        VStack(spacing: 14) {
            if mode == .signUp {
                inputField("Full name", text: $displayName, icon: "person", field: .name, textContentType: .name)
                    .textInputAutocapitalization(.words)
            }

            inputField("Email address", text: $email, icon: "envelope", field: .email, keyboardType: .emailAddress, textContentType: .emailAddress)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()

            inputField("Password", text: $password, icon: "lock", field: .password, isSecure: true, textContentType: .password)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()

            if mode == .signUp {
                inputField("Confirm password", text: $confirmPassword, icon: "lock.rotation", field: .confirmPassword, isSecure: true, textContentType: .password)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
            }
        }
    }

    private var togglePrompt: some View {
        HStack(spacing: 4) {
            Text(mode == .signIn ? "Need an account?" : "Already have an account?")
                .foregroundColor(AppTheme.Colors.mutedText)
                .font(.system(size: 14))

            Button {
                withAnimation(.easeInOut) {
                    switchMode(mode == .signIn ? .signUp : .signIn)
                }
            } label: {
                Text(mode == .signIn ? "Sign Up" : "Sign In")
                    .font(.system(size: 14, weight: .semibold))
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }

    // MARK: - Helpers

    private func switchMode(_ newMode: Mode) {
        guard newMode != mode else { return }
        mode = newMode
        validationMessage = nil

        if newMode == .signIn {
            focusNext(field: .email)
        } else {
            focusNext(field: .name)
        }
    }

    private func handleSubmit() {
        validationMessage = nil

        switch mode {
        case .signIn:
            guard !email.isEmpty, !password.isEmpty else {
                validationMessage = "Enter your email and password to continue."
                return
            }
            auth.signIn(email: email, password: password)

        case .signUp:
            guard !displayName.isEmpty else {
                validationMessage = "Let us know your name."
                return
            }

            guard !email.isEmpty else {
                validationMessage = "Email address is required."
                return
            }

            guard password.count >= 6 else {
                validationMessage = "Choose a password with at least 6 characters."
                return
            }

            guard password == confirmPassword else {
                validationMessage = "Passwords do not match."
                return
            }

            auth.quickSignUp(displayName: displayName, email: email, password: password)
        }

        dismiss()
    }

    @ViewBuilder
    private func inputField(_ placeholder: String,
                            text: Binding<String>,
                            icon: String,
                            field: Field,
                            isSecure: Bool = false,
                            keyboardType: UIKeyboardType = .default,
                            textContentType: UITextContentType?) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(AppTheme.Colors.accent)
                .frame(width: 22)

            Group {
                if isSecure {
                    SecureField(placeholder, text: text)
                } else {
                    TextField(placeholder, text: text)
                        .keyboardType(keyboardType)
                }
            }
            .textContentType(textContentType)
            .focused($focusedField, equals: field)
            .font(.system(size: 16))
            .foregroundColor(.white)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(AppTheme.Colors.card)
                .overlay(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .stroke(AppTheme.Colors.border, lineWidth: 1)
                )
        )
    }

    private func focusNext(field: Field) {
        focusedField = field
    }
}

struct SignInSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignInSignUpView(initialMode: .signIn)
                .environmentObject(AuthViewModel())
        }
        .preferredColorScheme(.dark)
    }
}
