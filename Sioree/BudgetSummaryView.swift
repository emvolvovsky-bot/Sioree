import SwiftUI

struct BudgetSummaryView: View {
    @ObservedObject var vm: EventCreationViewModel

    private var total: Double {
        vm.selectedAddOns.reduce(0) { $0 + $1.estimatedCost }
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Budget preview")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(AppTheme.Colors.charcoal)
                        Text("Instant cost breakdown as you layer services. Swap vendors, duplicate templates, or save for recurring series.")
                            .font(.system(size: 13))
                            .foregroundColor(AppTheme.Colors.mutedText)
                    }
                }

                GlassCard {
                    VStack(spacing: 16) {
                        ForEach(vm.selectedAddOns) { addOn in
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(addOn.name)
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(AppTheme.Colors.charcoal)
                                    Text(addOn.category.rawValue.capitalized)
                                        .font(.system(size: 11))
                                        .foregroundColor(AppTheme.Colors.mutedText)
                                }
                                Spacer()
                                Text("$\(Int(addOn.estimatedCost))")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(AppTheme.Colors.charcoal)
                            }

                            if addOn.id != vm.selectedAddOns.last?.id {
                                Divider().background(AppTheme.Colors.border)
                            }
                        }

                        Divider().background(AppTheme.Colors.border)

                        HStack {
                            Text("Estimated total")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(AppTheme.Colors.charcoal)
                            Spacer()
                            Text("$\(Int(total))")
                                .font(.system(size: 22, weight: .heavy))
                                .foregroundColor(AppTheme.Colors.charcoal)
                        }
                    }
                }

                GlassCard {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Save & repeat")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(AppTheme.Colors.charcoal)
                        Text("Turn this stack into a template for touring nights, branded activations, or community meetups.")
                            .font(.system(size: 13))
                            .foregroundColor(AppTheme.Colors.mutedText)
                    }
                }

                Button("Save event draft") {
                    // Hook into persistence later
                }
                .sioreePrimary()
            }
            .padding(.horizontal, 24)
            .padding(.top, 32)
            .padding(.bottom, 60)
        }
        .sioreeScreenBackground()
    }
}
