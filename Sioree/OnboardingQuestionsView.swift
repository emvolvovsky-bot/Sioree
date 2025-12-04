import SwiftUI

struct OnboardingQuestionsView: View {
    @EnvironmentObject var auth: AuthViewModel
    @State private var step = 0

    @State private var answer1 = ""
    @State private var answer2 = ""
    @State private var answer3 = ""

    var body: some View {
        VStack(spacing: 28) {
            ProgressView(value: Double(step + 1), total: 3)
                .tint(AppTheme.Colors.charcoal)
                .padding(.top, 32)

            Text(titleForStep(step))
                .font(.system(size: 26, weight: .heavy))
                .foregroundColor(AppTheme.Colors.charcoal)
                .frame(maxWidth: .infinity, alignment: .leading)

            GlassCard {
                VStack(alignment: .leading, spacing: 12) {
                    Text(placeholderForStep(step))
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(AppTheme.Colors.mutedText)

                    TextField("", text: bindingForStep(step))
                        .textFieldStyle(.plain)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(AppTheme.Colors.charcoal)
                }
            }

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
            .sioreePrimary()
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 40)
        .sioreeScreenBackground()
        .navigationBarBackButtonHidden(true)
    }

    // MARK: - Helpers

    private func titleForStep(_ step: Int) -> String {
        switch step {
        case 0: return "Where are you based?"
        case 1: return "What kind of events do you like?"
        case 2: return "What’s your vibe?"
        default: return ""
        }
    }

    private func placeholderForStep(_ step: Int) -> String {
        switch step {
        case 0: return "City, region, or multiple hubs."
        case 1: return "Parties, clubs, house events, art shows..."
        case 2: return "Chill, ravey, boujee, underground..."
        default: return ""
        }
    }

    private func bindingForStep(_ step: Int) -> Binding<String> {
        switch step {
        case 0: return $answer1
        case 1: return $answer2
        case 2: return $answer3
        default: return $answer1
        }
    }
}
//
//  OnboardingQuestionsView.swift
//  Sioree
//
//  Created by Emil Volvovsky on 12/2/25.
//


