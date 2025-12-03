import SwiftUI

struct EventCreationFlowView: View {
    @StateObject var vm = EventCreationViewModel()

    var body: some View {
        VStack(spacing: 0) {
            // progress pills
            HStack(spacing: 10) {
                stepPill("Details", isActive: vm.step == .details)
                stepPill("Add-ons", isActive: vm.step == .addOns)
                stepPill("Budget", isActive: vm.step == .summary)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)

            Divider().opacity(0.15)

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
            .font(.system(size: 12, weight: .medium))
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: AppTheme.Radii.pill)
                    .fill(isActive ? AppTheme.Colors.accent.opacity(0.22) : Color.white.opacity(0.02))
            )
            .overlay(
                RoundedRectangle(cornerRadius: AppTheme.Radii.pill)
                    .stroke(isActive ? AppTheme.Colors.accent : AppTheme.Colors.border, lineWidth: 1)
            )
            .foregroundColor(.white)
    }
}
