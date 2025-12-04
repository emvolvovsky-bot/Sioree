import SwiftUI

struct AuthView: View {
    @EnvironmentObject var auth: AuthViewModel

    private let flows = FlowHighlight.all
    private let lanes = FlowHighlight.lanes

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 32) {
                hero
                flowGrid
                customerLanes
                actionStack
                footer
            }
            .padding(.vertical, 40)
            .padding(.horizontal, 24)
        }
        .sioreeScreenBackground()
    }

    private var hero: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Sioree")
                .font(.system(size: 54, weight: .black, design: .rounded))
                .tracking(0.5)
                .foregroundColor(AppTheme.Colors.charcoal)

            Text("High-design meets underground culture. A calm, curated control room for every host, partier, talent, and brand.")
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(AppTheme.Colors.mutedText)
                .fixedSize(horizontal: false, vertical: true)

            GlassCard {
                VStack(alignment: .leading, spacing: 12) {
                    Text("MyPlots launched last month. They’re a beautiful test balloon — but they forgot the marketplace. We already have the hospitality network to claim the scene.")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(AppTheme.Colors.charcoal)

                    Text("Use their release as our rehearsal: learn what’s missing, then either acquire them or make them obsolete.")
                        .font(.system(size: 13))
                        .foregroundColor(AppTheme.Colors.mutedText)
                }
            }
        }
    }

    private var flowGrid: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 16) {
                Text("Core Look & Feel")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(AppTheme.Colors.mutedText)

                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 2), spacing: 16) {
                    ForEach(flows) { flow in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(flow.title)
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(AppTheme.Colors.charcoal)
                            Text(flow.subtitle)
                                .font(.system(size: 12))
                                .foregroundColor(AppTheme.Colors.mutedText)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(AppTheme.Colors.surfaceMuted)
                        .cornerRadius(AppTheme.Radii.tile)
                    }
                }
            }
        }
    }

    private var customerLanes: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 18) {
                Text("Sioree user flow overview")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(AppTheme.Colors.charcoal)

                ForEach(lanes) { lane in
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Text(lane.title)
                                .font(.system(size: 15, weight: .semibold))
                            Spacer()
                            Text(lane.badge.uppercased())
                                .font(.system(size: 11, weight: .heavy))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(AppTheme.Colors.surfaceMuted)
                                .cornerRadius(AppTheme.Radii.pill)
                        }
                        .foregroundColor(AppTheme.Colors.charcoal)

                        Text(lane.subtitle)
                            .font(.system(size: 13))
                            .foregroundColor(AppTheme.Colors.mutedText)
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    if lane.id != lanes.last?.id {
                        Divider().background(AppTheme.Colors.border)
                    }
                }
            }
        }
    }

    private var actionStack: some View {
        VStack(spacing: 16) {
            NavigationLink(destination: RoleSelectionView()) {
                Text("Create Your Account")
            }
            .sioreePrimary()

            Button("Continue as Guest") {
                auth.continueAsGuest()
            }
            .sioreeGhost()

            NavigationLink(destination: SignInSignUpView(initialMode: .signIn)) {
                Text("Already here? Sign in or switch accounts")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(AppTheme.Colors.mutedText)
            }
            .buttonStyle(.plain)
        }
    }

    private var footer: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Exclusive but effortless — calm, sleek, curated.")
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(AppTheme.Colors.charcoal)

            Text("By continuing you agree to our Terms & Privacy Policy.")
                .font(.system(size: 11))
                .foregroundColor(AppTheme.Colors.mutedText)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 24)
    }
}

extension AuthView {
    struct FlowHighlight: Identifiable, Equatable {
        let id = UUID()
        let title: String
        let subtitle: String
        let badge: String

        static let all: [FlowHighlight] = [
            .init(title: "White & Grey Minimalism", subtitle: "Flat, balanced layouts with generous negative space and monochrome surfaces.", badge: "core look"),
            .init(title: "Glow Accents", subtitle: "Monochrome visuals lit by icy-blue or warm glow gradients.", badge: "accent"),
            .init(title: "Clean Sans Typography", subtitle: "Bold headers, light body copy, simple rectangular buttons.", badge: "type"),
            .init(title: "Soft Motion", subtitle: "Smooth fades, effortless transitions, thoughtful state changes.", badge: "motion")
        ]

        static let lanes: [FlowHighlight] = [
            .init(title: "User login", subtitle: "Everyone begins with a seamless login / sign-up to unlock personalized flows.", badge: "all users"),
            .init(title: "Hosts & Teams", subtitle: "Dedicated dashboards for event creation, payments, and team management.", badge: "hosts"),
            .init(title: "Partier experience", subtitle: "Discovery feed, follow mechanics, ticket purchase, and social proof baked in.", badge: "partiers"),
            .init(title: "Talent listings", subtitle: "Verified DJs, bartenders, photographers, and rentals with pricing and reviews.", badge: "talent"),
            .init(title: "Brand collaborations", subtitle: "Sponsored listings, collab offers, and performance analytics for partners.", badge: "brands")
        ]
    }
}
