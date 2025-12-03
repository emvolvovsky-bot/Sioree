import SwiftUI

struct BudgetSummaryView: View {
    @ObservedObject var vm: EventCreationViewModel

    var totalCost: Double {
        vm.selectedAddOns.reduce(0) { $0 + $1.estimatedCost }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 22) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Budget preview")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)

                        Text("Rough cost breakdown for your event. You can tweak or swap vendors later.")
                            .font(.system(size: 11))
                            .foregroundColor(AppTheme.Colors.mutedText)
                    }
                }

                GlassCard {
                    VStack(spacing: 10) {
                        ForEach(vm.selectedAddOns) { addOn in
                            HStack {
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(addOn.name)
                                        .font(.system(size: 13, weight: .medium))
                                        .foregroundColor(.white)
                                    Text(addOn.category.rawValue.capitalized)
                                        .font(.system(size: 10))
                                        .foregroundColor(AppTheme.Colors.mutedText)
                                }
                                Spacer()
                                Text("$\(Int(addOn.estimatedCost))")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(AppTheme.Colors.accent)
                            }
                            .padding(.vertical, 4)

                            if addOn.id != vm.selectedAddOns.last?.id {
                                Divider().opacity(0.25)
                            }
                        }

                        Divider().opacity(0.25)
                            .padding(.top, 4)

                        HStack {
                            Text("Estimated total")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                            Spacer()
                            Text("$\(Int(totalCost))")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(AppTheme.Colors.accent)
                        }
                        .padding(.top, 4)
                    }
                }

                Button("Save event draft") {
                    // TODO: persist
                }
                .sioreePrimary()
            }
            .padding(.horizontal, 20)
            .padding(.top, 24)
            .padding(.bottom, 40)
        }
        .sioreeScreenBackground()
    }
}
