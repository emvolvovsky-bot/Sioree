import SwiftUI

struct AddOnsStepView: View {
    @ObservedObject var vm: EventCreationViewModel
    private let options = MockData.events.first?.addOns ?? []

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Add-ons & services")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(AppTheme.Colors.charcoal)

                        Text("Cleaning, security, bartenders, performers, tech setup — anything needed to pull off the experience, verified and ready.")
                            .font(.system(size: 13))
                            .foregroundColor(AppTheme.Colors.mutedText)
                    }
                }

                ForEach(options) { option in
                    addOnRow(option)
                }

                Button("Preview budget") {
                    vm.step = .summary
                }
                .sioreePrimary()
            }
            .padding(.horizontal, 24)
            .padding(.top, 32)
            .padding(.bottom, 60)
        }
    }

    private func addOnRow(_ option: AddOnOption) -> some View {
        let isSelected = vm.selectedAddOns.contains(where: { $0.id == option.id })

        return GlassCard {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(option.name)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(AppTheme.Colors.charcoal)
                        Text(option.description)
                            .font(.system(size: 12))
                            .foregroundColor(AppTheme.Colors.mutedText)
                    }

                    Spacer()

                    Text("$\(Int(option.estimatedCost)) est.")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(AppTheme.Colors.charcoal)
                }

                HStack {
                    Text(option.category.rawValue.capitalized)
                        .font(.system(size: 11, weight: .medium))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(AppTheme.Colors.surfaceMuted)
                        .cornerRadius(AppTheme.Radii.pill)
                        .foregroundColor(AppTheme.Colors.charcoal)

                    Spacer()

                    Button(isSelected ? "Added" : "Add") {
                        if isSelected {
                            vm.selectedAddOns.removeAll { $0.id == option.id }
                        } else {
                            vm.selectedAddOns.append(option)
                        }
                    }
                    .buttonStyle(SioreeButtonStyle(isGhost: isSelected, fullWidth: false))
                }
            }
        }
    }
}
