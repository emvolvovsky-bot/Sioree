//
//  FlowLayout.swift
//  Sioree
//
//  Created by Emil Volvovsky on 12/3/25.
//
import SwiftUI


struct FlowLayout<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let mode: Mode
    let items: Data
    let spacing: CGFloat
    let lineSpacing: CGFloat
    let content: (Data.Element) -> Content

    init(
        mode: Mode = .scrollable,
        items: Data,
        spacing: CGFloat,
        lineSpacing: CGFloat,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        self.mode = mode
           self.items = items
        self.spacing = spacing
        self.lineSpacing = lineSpacing
        self.content = content
    }

    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var rows: [[Data.Element]] = [[]]

        for item in items {
            let itemSize = CGSize(width: g.size.width, height: .infinity)

            if width + 100 > g.size.width {   // approximate
                width = 0
                rows.append([item])
            } else {
                rows[rows.count - 1].append(item)
            }

            width += 100 + spacing // general placeholder width
        }

        return VStack(alignment: .leading, spacing: lineSpacing) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: spacing) {
                    ForEach(row, id: \.self) { item in
                        content(item)
                    }
                }
            }
        }
    }

    enum Mode {
        case scrollable, vstack
    }
}

