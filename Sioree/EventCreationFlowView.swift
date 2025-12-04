import SwiftUI

struct EventCreationFlowView: View {
    @StateObject var vm = EventCreationViewModel()

    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Event creation")
                    .font(.system(size: 28, weight: .heavy))
                    .foregroundColor(AppTheme.Colors.charcoal)

                HStack(spacing: 10) {
                    stepPill("Details", isActive: vm.step == .details)
                    stepPill("Add-ons", isActive: vm.step == .addOns)
                    stepPill("Budget", isActive: vm.step == .summary)
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 32)
            .padding(.bottom, 18)

            Divider().background(AppTheme.Colors.border)

            Group {
                switch vm.step {
                case .details:
                    EventDetailsStepView(vm: vm)
                case .addOns:
                    AddOnsStepView(vm: vm)
                case .summary:
                    BudgetSummaryView(vm: vm)
                }
            }
        }
        .sioreeScreenBackground()
    }

    private func stepPill(_ title: String, isActive: Bool) -> some View {
        Text(title)
            .font(.system(size: 13, weight: .semibold))
            .padding(.horizontal, 18)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: AppTheme.Radii.pill)
                    .fill(isActive ? AppTheme.Colors.charcoal : AppTheme.Colors.surface)
            )
            .foregroundColor(isActive ? .white : AppTheme.Colors.mutedText)
            .overlay(
                RoundedRectangle(cornerRadius: AppTheme.Radii.pill)
                    .stroke(AppTheme.Colors.border, lineWidth: 1)
            )
    }
}
