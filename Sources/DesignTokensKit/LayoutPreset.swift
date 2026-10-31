import SwiftUI

/// Geometry presets contain no product-specific colors. Hosts select a preset and
/// supply semantic colors from their asset catalogs.
public struct LayoutPreset: Sendable {
    public var screenInset: CGFloat
    public var sectionSpacing: CGFloat
    public var itemSpacing: CGFloat
    public var controlSpacing: CGFloat
    public var cardPadding: CGFloat
    public var cardRadius: CGFloat
    public var controlRadius: CGFloat
    public var minimumControlHeight: CGFloat
    public var borderWidth: CGFloat

    public init(screenInset: CGFloat, sectionSpacing: CGFloat, itemSpacing: CGFloat,
                controlSpacing: CGFloat, cardPadding: CGFloat, cardRadius: CGFloat,
                controlRadius: CGFloat, minimumControlHeight: CGFloat, borderWidth: CGFloat = 1) {
        self.screenInset = screenInset; self.sectionSpacing = sectionSpacing
        self.itemSpacing = itemSpacing; self.controlSpacing = controlSpacing
        self.cardPadding = cardPadding; self.cardRadius = cardRadius
        self.controlRadius = controlRadius; self.minimumControlHeight = minimumControlHeight
        self.borderWidth = borderWidth
    }

    /// MyTV: compact, structured browsing; density never shrinks touch targets.
    public static let compactMedia = LayoutPreset(screenInset: 16, sectionSpacing: 24,
        itemSpacing: 8, controlSpacing: 8, cardPadding: 12, cardRadius: 12,
        controlRadius: 10, minimumControlHeight: 48)
    /// ShowBook: calm editorial hierarchy with generous reading space.
    public static let editorial = LayoutPreset(screenInset: 20, sectionSpacing: 28,
        itemSpacing: 12, controlSpacing: 12, cardPadding: 16, cardRadius: 12,
        controlRadius: 8, minimumControlHeight: 48)
    /// Motivation Daily: softer, spacious content with larger primary actions.
    public static let softWellness = LayoutPreset(screenInset: 24, sectionSpacing: 32,
        itemSpacing: 16, controlSpacing: 12, cardPadding: 20, cardRadius: 20,
        controlRadius: 14, minimumControlHeight: 52)

    public var card: SurfaceMetrics {
        .init(padding: .init(top: cardPadding, leading: cardPadding,
                            bottom: cardPadding, trailing: cardPadding),
              cornerRadius: cardRadius, borderWidth: borderWidth)
    }
    public var button: ButtonMetrics {
        .init(padding: .init(top: 12, leading: 16, bottom: 12, trailing: 16),
              minimumWidth: 44, minimumHeight: minimumControlHeight, cornerRadius: controlRadius)
    }
}
