import SwiftUI

public extension Spacing {
    static let zero: CGFloat = 0
    /// SwiftUI's environment-dependent default, deliberately not a fixed point value.
    static let system: CGFloat? = nil
}

public struct CatalogTileMetrics: Sendable {
    public var surface: SurfaceMetrics
    public var spacing: CGFloat
    public var artworkPadding: CGFloat
    public var detailPadding: CGFloat
    public var width: CGFloat?
    public var minimumHeight: CGFloat?
    public var contentWidth: CGFloat?
    public var contentMinHeight: CGFloat?

    public init(surface: SurfaceMetrics = SurfaceMetrics(), spacing: CGFloat = Spacing.twelve,
                artworkPadding: CGFloat = Spacing.ten, detailPadding: CGFloat = Spacing.ten,
                width: CGFloat? = nil, minimumHeight: CGFloat? = nil,
                contentWidth: CGFloat? = nil, contentMinHeight: CGFloat? = nil) {
        self.surface = surface; self.spacing = spacing
        self.artworkPadding = artworkPadding; self.detailPadding = detailPadding
        self.width = width; self.minimumHeight = minimumHeight
        self.contentWidth = contentWidth; self.contentMinHeight = contentMinHeight
    }

    public static let standard = Self(surface: SurfaceMetrics(cornerRadius: CornerRadius.twenty))
    public static let plainRow = Self(surface: SurfaceMetrics(padding: EdgeInsets()))
    public static func compactGrid(accessibility: Bool) -> Self {
        Self(surface: SurfaceMetrics(padding: EdgeInsets(), cornerRadius: CornerRadius.twenty),
             width: accessibility ? 160 : 120, minimumHeight: accessibility ? 170 : 120,
             contentWidth: accessibility ? 150 : 110, contentMinHeight: accessibility ? 150 : 110)
    }
}

public enum CatalogMetrics {
    public static let coverListSize = CGSize(width: 60, height: 100)
    public static let coverGridSize = CGSize(width: 90, height: 150)
    public static let bookGridMinimum: CGFloat = 160
    public static let coverRadius: CGFloat = 5
    public static let compactLogoSize = CGSize(width: 90, height: 64)
    public static let accessibleLogoSize = CGSize(width: 120, height: 80)
    public static let listTitleLines = 2
    public static let accessibleTitleLines = 3
    public static let gridTitleLines = 2
    public static let maximumRating = 5
}
