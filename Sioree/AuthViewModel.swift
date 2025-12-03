import SwiftUI

enum AuthSessionType: String, Codable {
    case signedUp
    case guest
}

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var sessionType: AuthSessionType? = nil
    @Published var selectedRole: UserRole? = nil

    @Published var onboardingAnswers: [String: String] = [:]

    private let authKey = "sioree_is_authenticated"
    private let sessionTypeKey = "sioree_session_type"
    private let roleKey = "sioree_selected_role"
    private let onboardingKey = "sioree_onboarding_answers"

    init() {
        restoreSession()
    }

    // MARK: - Entry Points

    func signUp() {
        // UI handles navigation → role selection → questions
    }

    func signUpComplete(as role: UserRole) {
        selectedRole = role
        sessionType = .signedUp
        isAuthenticated = true
        persist()
    }

    // MARK: - Lightweight Auth

    func signIn(email: String, password: String) {
        // Simulated sign-in: mark the session as authenticated.
        selectedRole = selectedRole ?? .partier
        sessionType = .signedUp
        isAuthenticated = true
        persist()
    }

    func quickSignUp(displayName: String, email: String, password: String) {
        // For prototype purposes we immediately authenticate the user.
        selectedRole = selectedRole ?? .host
        sessionType = .signedUp
        isAuthenticated = true
        persist()
    }

    func continueAsGuest() {
        selectedRole = nil
        sessionType = .guest
        isAuthenticated = true
        persist()
    }

    // MARK: - Onboarding

    func completeOnboarding(answers: [String: String]) {
        onboardingAnswers = answers
        sessionType = .signedUp
        isAuthenticated = true
        persist()
    }

    // ✅ Missing function your view needs
    func completeOnboarding(answer1: String, answer2: String, answer3: String) {
        let answers = [
            "location": answer1,
            "events": answer2,
            "vibe": answer3
        ]

        completeOnboarding(answers: answers)
    }

    // MARK: - Logout

    func logout() {
        isAuthenticated = false
        sessionType = nil
        selectedRole = nil
        onboardingAnswers = [:]

        UserDefaults.standard.removeObject(forKey: authKey)
        UserDefaults.standard.removeObject(forKey: sessionTypeKey)
        UserDefaults.standard.removeObject(forKey: roleKey)
        UserDefaults.standard.removeObject(forKey: onboardingKey)
    }

    // MARK: - Persistence

    private func persist() {
        UserDefaults.standard.set(isAuthenticated, forKey: authKey)

        if let sessionType {
            UserDefaults.standard.set(sessionType.rawValue, forKey: sessionTypeKey)
        }

        if let selectedRole {
            UserDefaults.standard.set(selectedRole.rawValue, forKey: roleKey)
        }

        if !onboardingAnswers.isEmpty {
            UserDefaults.standard.set(onboardingAnswers, forKey: onboardingKey)
        }
    }

    private func restoreSession() {
        let savedAuth = UserDefaults.standard.bool(forKey: authKey)

        guard savedAuth else {
            isAuthenticated = false
            sessionType = nil
            selectedRole = nil
            onboardingAnswers = [:]
            return
        }

        isAuthenticated = true

        if let rawType = UserDefaults.standard.string(forKey: sessionTypeKey),
           let type = AuthSessionType(rawValue: rawType) {
            sessionType = type
        }

        if let rawRole = UserDefaults.standard.string(forKey: roleKey),
           let role = UserRole(rawValue: rawRole) {
            selectedRole = role
        }

        if let answers = UserDefaults.standard.dictionary(forKey: onboardingKey) as? [String: String] {
            onboardingAnswers = answers
        }
    }
}
