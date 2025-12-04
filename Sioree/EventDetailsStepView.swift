import SwiftUI

struct EventDetailsStepView: View {
    @ObservedObject var vm: EventCreationViewModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Event basics")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(AppTheme.Colors.charcoal)

                        field("Event title", text: $vm.title)
                        field("City / neighborhood", text: $vm.city)

                        Text("Set the tone now — add ticket tiers, media, and team members later.")
                            .font(.system(size: 12))
                            .foregroundColor(AppTheme.Colors.mutedText)
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Not just parties")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(AppTheme.Colors.charcoal)

                        Text("From corporate summits to cultural gatherings, workshops, weddings, charity functions, and anything needing premium service + staff.")
                            .font(.system(size: 13))
                            .foregroundColor(AppTheme.Colors.mutedText)
                    }
                }

                Button("Continue to add-ons") {
                    vm.step = .addOns
                }
                .sioreePrimary()
            }
            .padding(.horizontal, 24)
            .padding(.top, 32)
            .padding(.bottom, 60)
        }
    }

    private func field(_ placeholder: String, text: Binding<String>) -> some View {
        TextField(placeholder, text: text)
            .textFieldStyle(.plain)
            .padding(.horizontal, 14)
            .padding(.vertical, 14)
            .background(AppTheme.Colors.surfaceMuted)
            .foregroundColor(AppTheme.Colors.charcoal)
            .cornerRadius(AppTheme.Radii.tile)
            .overlay(
                RoundedRectangle(cornerRadius: AppTheme.Radii.tile)
                    .stroke(AppTheme.Colors.border, lineWidth: 1)
            )
    }
}
