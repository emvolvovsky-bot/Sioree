import SwiftUI

struct AddOnsStepView: View {
    @ObservedObject var vm: EventCreationViewModel

    // In a real app, fetch from store; for now sample off first event
    private let options = MockData.events.first?.addOns ?? []

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 18) {
                GlassCard {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Add services & staff")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)

                        Text("Cleaning, security, DJs, bartenders, tech — everything in one place.")
                            .font(.system(size: 11))
                            .foregroundColor(AppTheme.Colors.mutedText)
                    }
                }

                ForEach(options) { opt in
                    addOnRow(opt)
                }

                Button("Preview budget") {
                    vm.step = .summary
                }
                .sioreePrimary()
            }
            .padding(.horizontal, 20)
            .padding(.top, 24)
            .padding(.bottom, 40)
        }
    }

    private func addOnRow(_ opt: AddOnOption) -> some View {
        let isSelected = vm.selectedAddOns.contains(where: { $0.id == opt.id })

        return GlassCard {
            HStack(alignment: .center, spacing: 12) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(opt.name)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)

                    Text(opt.description)
                        .font(.system(size: 11))
                        .foregroundColor(AppTheme.Colors.mutedText)

                    Text("$\(Int(opt.estimatedCost)) est.")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(AppTheme.Colors.accent)
                }

                Spacer()

                Button(isSelected ? "Added" : "Add") {
                    if isSelected {
                        vm.selectedAddOns.removeAll { $0.id == opt.id }
                    } else {
                        vm.selectedAddOns.append(opt)
                    }
                }
                .sioreeGhost()
                .opacity(isSelected ? 0.9 : 1.0)
            }
        }
    }
}
