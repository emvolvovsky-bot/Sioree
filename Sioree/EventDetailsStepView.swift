import SwiftUI

struct EventDetailsStepView: View {
    @ObservedObject var vm: EventCreationViewModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 22) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Event basics")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)

                        TextField("Event title", text: $vm.title)
                            .textFieldStyle(.plain)
                            .padding(10)
                            .background(Color.white.opacity(0.05))
                            .cornerRadius(10)
                            .foregroundColor(.white)

                        TextField("City / neighborhood", text: $vm.city)
                            .textFieldStyle(.plain)
                            .padding(10)
                            .background(Color.white.opacity(0.05))
                            .cornerRadius(10)
                            .foregroundColor(.white)

                        Text("You can add ticket tiers, dates, and media later.")
                            .font(.system(size: 11))
                            .foregroundColor(AppTheme.Colors.mutedText)
                    }
                }

                Button("Continue to add-ons") {
                    vm.step = .addOns
                }
                .sioreePrimary()
            }
            .padding(.horizontal, 20)
            .padding(.top, 24)
            .padding(.bottom, 40)
        }
    }
}
