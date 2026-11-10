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

    // MARK: - Semantic Layout Presets
    /// Compact layout: structured, high-density browsing with preserved minimum touch targets.
    public static let compact = LayoutPreset(
        screenInset: 16, sectionSpacing: 24, itemSpacing: 8, controlSpacing: 8,
        cardPadding: 12, cardRadius: 12, controlRadius: 10, minimumControlHeight: 48
    )

    /// Regular layout: balanced hierarchy with standard reading space.
    public static let regular = LayoutPreset(
        screenInset: 20, sectionSpacing: 28, itemSpacing: 12, controlSpacing: 12,
        cardPadding: 16, cardRadius: 12, controlRadius: 8, minimumControlHeight: 48
    )

    /// Spacious layout: relaxed, generous padding with prominent primary actions.
    public static let spacious = LayoutPreset(
        screenInset: 24, sectionSpacing: 32, itemSpacing: 16, controlSpacing: 12,
        cardPadding: 20, cardRadius: 20, controlRadius: 14, minimumControlHeight: 52
    )

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

// MARK: - Semantic Size Presets

public enum IconPreset: Sendable {
    public static let small = CGSize(width: 18, height: 18)
    public static let medium = CGSize(width: 28, height: 28)
    public static let large = CGSize(width: 36, height: 36)
}

extension IconMetrics {
    public static let small = IconMetrics(size: IconPreset.small)
    public static let medium = IconMetrics(size: IconPreset.medium)
    public static let large = IconMetrics(size: IconPreset.large)
}

public struct AvatarMetrics: Sendable, Equatable {
    public var size: CGSize
    public var cornerRadius: CGFloat

    public init(size: CGSize, cornerRadius: CGFloat) {
        self.size = size
        self.cornerRadius = cornerRadius
    }

    public static let small = AvatarMetrics(size: CGSize(width: 28, height: 28), cornerRadius: 14)
    public static let medium = AvatarMetrics(size: CGSize(width: 40, height: 40), cornerRadius: 20)
    public static let large = AvatarMetrics(size: CGSize(width: 56, height: 56), cornerRadius: 28)
}

public enum AvatarPreset: Sendable {
    public static let small = CGSize(width: 28, height: 28)
    public static let medium = CGSize(width: 40, height: 40)
    public static let large = CGSize(width: 56, height: 56)
}

public enum TouchTargetPreset: Sendable {
    public static let minimum: CGFloat = TouchTarget.minimum
    public static let standard: CGFloat = 48
    public static let spacious: CGFloat = 52
}

extension TouchTarget {
    public static let min: CGFloat = minimum
    public static let standard: CGFloat = 48
    public static let spacious: CGFloat = 52
}

public struct ThumbnailMetrics: Sendable, Equatable {
    public var size: CGSize
    public var cornerRadius: CGFloat

    public init(size: CGSize, cornerRadius: CGFloat = 8) {
        self.size = size
        self.cornerRadius = cornerRadius
    }

    public static let small = ThumbnailMetrics(size: CGSize(width: 60, height: 90), cornerRadius: 6)
    public static let medium = ThumbnailMetrics(size: CGSize(width: 90, height: 135), cornerRadius: 8)
    public static let large = ThumbnailMetrics(size: CGSize(width: 120, height: 180), cornerRadius: 12)
    public static let channelLogo = ThumbnailMetrics(size: CGSize(width: 96, height: 60), cornerRadius: 8)
    public static let card = ThumbnailMetrics(size: CGSize(width: 120, height: 170), cornerRadius: 12)
}

public enum ThumbnailPreset: Sendable {
    public static let small = CGSize(width: 60, height: 90)
    public static let medium = CGSize(width: 90, height: 135)
    public static let large = CGSize(width: 120, height: 180)
    public static let channelLogo = CGSize(width: 96, height: 60)
    public static let card = CGSize(width: 120, height: 170)
}
