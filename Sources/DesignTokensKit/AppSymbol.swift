import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

/// Strongly-typed canonical iconography tokens backed by Apple SF Symbols.
/// Centralizes all glyph identifiers across client apps and shared kits.
public enum AppSymbol: String, Sendable, CaseIterable {
    // Universal & Navigation
    case checkmark = "checkmark"
    case checkmarkCircleFill = "checkmark.circle.fill"
    case checkmarkSealFill = "checkmark.seal.fill"
    case xmark = "xmark"
    case chevronLeft = "chevron.left"
    case chevronRight = "chevron.right"
    case chevronUp = "chevron.up"
    case chevronDown = "chevron.down"
    case ellipsis = "ellipsis"
    case ellipsisCircle = "ellipsis.circle"
    case magnifyingglass = "magnifyingglass"
    case arrowClockwise = "arrow.clockwise"
    case arrowUpArrowDown = "arrow.up.arrow.down"
    
    // Actions & Media
    case squareAndArrowUp = "square.and.arrow.up"
    case squareAndArrowDown = "square.and.arrow.down"
    case docOnDocFill = "doc.on.doc.fill"
    case paperplane = "paperplane"
    case paperplaneFill = "paperplane.fill"
    case crop = "crop"
    case cropSquare = "crop.square"
    case sliderHorizontal3 = "slider.horizontal.3"
    case play = "play"
    case playFill = "play.fill"
    case trash = "trash"
    case trashFill = "trash.fill"
    case photo = "photo"
    case photoFill = "photo.fill"
    case photoBadgeCheckmarkFill = "photo.badge.checkmark.fill"
    case quoteOpening = "quote.opening"
    case sparkles = "sparkles"
    
    // Status & System
    case wifi = "wifi"
    case wifiSlash = "wifi.slash"
    case wifiExclamationmark = "wifi.exclamationmark"
    case antennaRadiowavesLeftAndRightSlash = "antenna.radiowaves.left.and.right.slash"
    case exclamationmarkTriangle = "exclamationmark.triangle"
    case exclamationmarkTriangleFill = "exclamationmark.triangle.fill"
    case infoCircle = "info.circle"
    case bell = "bell"
    case bellBadgeFill = "bell.badge.fill"
    case gearshape = "gearshape"
    
    // Domain & Content
    case heart = "heart"
    case heartFill = "heart.fill"
    case heartSlash = "heart.slash"
    case tv = "tv"
    case tvSlash = "tv.slash"
    case book = "book"
    case bookFill = "book.fill"
    case bookClosed = "book.closed"
    case bookmark = "bookmark"
    case bookmarkFill = "bookmark.fill"
    case tag = "tag"
    case tray = "tray"
    case globe = "globe"
    case appleLogo = "apple.logo"
    case envelope = "envelope"
    case handRaised = "hand.raised"
    
    // User & Account
    case person = "person"
    case personCropCircle = "person.crop.circle"
    case personCropCircleBadgeExclamationmark = "person.crop.circle.badge.exclamationmark"
    case rectanglePortraitAndArrowRight = "rectangle.portrait.and.arrow.right"
    
    // Layout & Display
    case squareGrid2x2 = "square.grid.2x2"
    case listBullet = "list.bullet"
    case line3Horizontal = "line.3.horizontal"
    case line3HorizontalCircleFill = "line.3.horizontal.circle.fill"
    case line3HorizontalDecrease = "line.3.horizontal.decrease"
    case line3HorizontalDecreaseCircle = "line.3.horizontal.decrease.circle"
    case circleLefthalfFilled = "circle.lefthalf.filled"

    public var systemName: String { rawValue }
}

public typealias DesignSymbol = AppSymbol

// MARK: - SwiftUI Convenience Initializers

extension Image {
    public init(symbol: AppSymbol) {
        self.init(systemName: symbol.systemName)
    }
}

extension Label where Title == Text, Icon == Image {
    public init(_ titleKey: LocalizedStringKey, symbol: AppSymbol) {
        self.init(titleKey, systemImage: symbol.systemName)
    }

    public init<S>(_ title: S, symbol: AppSymbol) where S: StringProtocol {
        self.init(title, systemImage: symbol.systemName)
    }
}

#if canImport(UIKit)
extension UIImage {
    public convenience init?(symbol: AppSymbol) {
        self.init(systemName: symbol.systemName)
    }
}
#endif
