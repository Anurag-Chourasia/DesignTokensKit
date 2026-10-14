import SwiftUI

/// Exact point values shared by consumers. These are primitives, not app roles.
/// System-default padding is represented by Spacing.system; bespoke point values live in DesignMetric.
public enum Spacing {
    public static let four: CGFloat = 4
    public static let five: CGFloat = 5
    public static let eight: CGFloat = 8
    public static let ten: CGFloat = 10
    public static let twelve: CGFloat = 12
    public static let fourteen: CGFloat = 14
    public static let sixteen: CGFloat = 16
    public static let twenty: CGFloat = 20
    public static let thirty: CGFloat = 30
    public static let thirtyTwo: CGFloat = 32
}

/// Source-backed radii, not a universal policy for cards or controls.
public enum CornerRadius {
    public static let four: CGFloat = 4
    public static let six: CGFloat = 6
    public static let ten: CGFloat = 10
    public static let twelve: CGFloat = 12
    public static let fourteen: CGFloat = 14
    public static let fifteen: CGFloat = 15
    public static let twenty: CGFloat = 20
    public static let thirty: CGFloat = 30
}

/// Point widths. These are not device-pixel hairlines.
public enum StrokeWidth {
    public static let one: CGFloat = 1
    public static let two: CGFloat = 2
}

public enum TouchTarget {
    public static let minimum: CGFloat = 44
}

/// Nil padding preserves SwiftUI's environment-dependent system padding.
/// Icon artwork size is independent of a control's touch target.
public struct IconMetrics: Sendable, Equatable {
    public var size: CGSize
    public var padding: CGFloat?

    public init(size: CGSize = CGSize(width: 15, height: 15), padding: CGFloat? = nil) {
        self.size = size
        self.padding = padding
    }
}

/// Dynamic Type-aware semantic fonts for status messages; consumers can override each role.
public struct MessageTypography: Sendable {
    public var icon: Font
    public var title: Font
    public var detail: Font

    public init(icon: Font = .largeTitle, title: Font = .headline, detail: Font = .caption) {
        self.icon = icon
        self.title = title
        self.detail = detail
    }
}

/// App-owned semantic colors. Color values are retained without resolving to RGB,
/// so dynamic system colors continue to respond to the rendering environment.
public struct SemanticColors: Sendable {
    public var surface: Color
    public var foreground: Color
    public var border: Color
    public var action: Color
    public var onAction: Color

    public init(
        surface: Color = .clear,
        foreground: Color = .primary,
        border: Color = .clear,
        action: Color = .accentColor,
        onAction: Color = .primary
    ) {
        self.surface = surface
        self.foreground = foreground
        self.border = border
        self.action = action
        self.onAction = onAction
    }
}

/// Geometry owned by an individual surface, rather than one universal card radius.
public struct SurfaceMetrics: Sendable, Equatable {
    public var padding: EdgeInsets
    public var cornerRadius: CGFloat
    public var borderWidth: CGFloat

    public init(
        padding: EdgeInsets = EdgeInsets(top: Spacing.sixteen, leading: Spacing.sixteen,
                                       bottom: Spacing.sixteen, trailing: Spacing.sixteen),
        cornerRadius: CGFloat = 0,
        borderWidth: CGFloat = 0
    ) {
        self.padding = padding
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
    }
}

/// Minimum dimensions grow with content; they never impose a fixed text height.
public struct ButtonMetrics: Sendable, Equatable {
    public var padding: EdgeInsets
    public var minimumWidth: CGFloat
    public var minimumHeight: CGFloat
    public var cornerRadius: CGFloat

    public init(
        padding: EdgeInsets = EdgeInsets(top: Spacing.eight, leading: Spacing.sixteen,
                                       bottom: Spacing.eight, trailing: Spacing.sixteen),
        minimumWidth: CGFloat = TouchTarget.minimum,
        minimumHeight: CGFloat = TouchTarget.minimum,
        cornerRadius: CGFloat = 0
    ) {
        self.padding = padding
        self.minimumWidth = minimumWidth
        self.minimumHeight = minimumHeight
        self.cornerRadius = cornerRadius
    }
}
