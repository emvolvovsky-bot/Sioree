//
//  OnboardingQuestionsView.swift
//  Sioree
//
//  Created by Emil Volvovsky on 12/2/25.
//


import SwiftUI

struct OnboardingQuestionsView: View {
    @EnvironmentObject var auth: AuthViewModel
    @State private var step = 0

    @State private var answer1 = ""
    @State private var answer2 = ""
    @State private var answer3 = ""

    var body: some View {
        VStack(spacing: 30) {

            Text(titleForStep(step))
                .font(.system(size: 26, weight: .bold))
                .foregroundColor(.white)
                .padding(.top, 40)

            TextField(placeholderForStep(step), text: bindingForStep(step))
                .padding()
                .background(Color.white.opacity(0.08))
                .cornerRadius(14)
                .foregroundColor(.white)

            Spacer()

            Button(step == 2 ? "Finish" : "Next") {
                if step < 2 {
                    step += 1
                } else {
                    auth.completeOnboarding(
                        answer1: answer1,
                        answer2: answer2,
                        answer3: answer3
                    )
                }
            }
            .font(.system(size: 17, weight: .semibold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(AppTheme.Gradients.hero)
            .cornerRadius(20)
        }
        .padding(24)
        .background(AppTheme.Colors.background)
        .navigationBarBackButtonHidden(true)
    }

    // MARK: - Helpers

    func titleForStep(_ step: Int) -> String {
        switch step {
        case 0: return "Where are you based?"
        case 1: return "What kind of events do you like?"
        case 2: return "What’s your vibe?"
        default: return ""
        }
    }

    func placeholderForStep(_ step: Int) -> String {
        switch step {
        case 0: return "City, region..."
        case 1: return "Parties, clubs, house events..."
        case 2: return "Chill, ravey, boujee..."
        default: return ""
        }
    }

    func bindingForStep(_ step: Int) -> Binding<String> {
        switch step {
        case 0: return $answer1
        case 1: return $answer2
        case 2: return $answer3
        default: return $answer1
        }
    }
}
