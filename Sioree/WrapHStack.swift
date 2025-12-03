import SwiftUI

/// Wraps items horizontally and moves to the next line when needed.
struct WrapHStack<Data: RandomAccessCollection, Content: View>: View where Data.Element: Hashable {
    let data: Data
    let spacing: CGFloat
    let lineSpacing: CGFloat
    let content: (Data.Element) -> Content

    init(
        data: Data,
        spacing: CGFloat = 10,
        lineSpacing: CGFloat = 10,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        self.data = data
        self.spacing = spacing
        self.lineSpacing = lineSpacing
        self.content = content
    }

    var body: some View {
        FlexibleView(
            data: data,
            spacing: spacing,
            lineSpacing: lineSpacing,
            content: content
        )
    }
}

