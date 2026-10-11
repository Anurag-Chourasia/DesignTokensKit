import SwiftUI

/// Exact point values shared by consumers. These are primitives, not app roles.
/// Keep implicit system padding and bespoke dimensions at their original call sites.
public enum Spacing {
    public static let eight: CGFloat = 8
    public static let twelve: CGFloat = 12
    public static let sixteen: CGFloat = 16
    public static let twenty: CGFloat = 20
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
        minimumWidth: CGFloat = 44,
        minimumHeight: CGFloat = 44,
        cornerRadius: CGFloat = 0
    ) {
        self.padding = padding
        self.minimumWidth = minimumWidth
        self.minimumHeight = minimumHeight
        self.cornerRadius = cornerRadius
    }
}
