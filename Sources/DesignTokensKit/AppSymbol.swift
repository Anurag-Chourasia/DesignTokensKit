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
    case circle = "circle"
    case largecircleFillCircle = "largecircle.fill.circle"

    public var systemName: String { rawValue }
}

public typealias DesignSymbol = AppSymbol

// MARK: - KeyPath Theme for Iconography

public struct SymbolTheme: Sendable, Equatable {
    public var checkmark: AppSymbol = .checkmark
    public var checkmarkCircleFill: AppSymbol = .checkmarkCircleFill
    public var checkmarkSealFill: AppSymbol = .checkmarkSealFill
    public var xmark: AppSymbol = .xmark
    public var close: AppSymbol = .xmark
    public var chevronLeft: AppSymbol = .chevronLeft
    public var chevronRight: AppSymbol = .chevronRight
    public var chevronUp: AppSymbol = .chevronUp
    public var chevronDown: AppSymbol = .chevronDown
    public var ellipsis: AppSymbol = .ellipsis
    public var ellipsisCircle: AppSymbol = .ellipsisCircle
    public var magnifyingglass: AppSymbol = .magnifyingglass
    public var search: AppSymbol = .magnifyingglass
    public var arrowClockwise: AppSymbol = .arrowClockwise
    public var arrowUpArrowDown: AppSymbol = .arrowUpArrowDown
    public var sort: AppSymbol = .arrowUpArrowDown

    public var squareAndArrowUp: AppSymbol = .squareAndArrowUp
    public var squareAndArrowDown: AppSymbol = .squareAndArrowDown
    public var docOnDocFill: AppSymbol = .docOnDocFill
    public var copy: AppSymbol = .docOnDocFill
    public var paperplane: AppSymbol = .paperplane
    public var paperplaneFill: AppSymbol = .paperplaneFill
    public var share: AppSymbol = .paperplaneFill
    public var crop: AppSymbol = .crop
    public var cropSquare: AppSymbol = .cropSquare
    public var sliderHorizontal3: AppSymbol = .sliderHorizontal3
    public var slider: AppSymbol = .sliderHorizontal3
    public var play: AppSymbol = .play
    public var playFill: AppSymbol = .playFill
    public var trash: AppSymbol = .trash
    public var trashFill: AppSymbol = .trashFill
    public var photo: AppSymbol = .photo
    public var photoFill: AppSymbol = .photoFill
    public var photoBadgeCheckmarkFill: AppSymbol = .photoBadgeCheckmarkFill
    public var quoteOpening: AppSymbol = .quoteOpening
    public var sparkles: AppSymbol = .sparkles

    public var wifi: AppSymbol = .wifi
    public var wifiSlash: AppSymbol = .wifiSlash
    public var wifiExclamationmark: AppSymbol = .wifiExclamationmark
    public var antennaRadiowavesLeftAndRightSlash: AppSymbol = .antennaRadiowavesLeftAndRightSlash
    public var exclamationmarkTriangle: AppSymbol = .exclamationmarkTriangle
    public var exclamationmarkTriangleFill: AppSymbol = .exclamationmarkTriangleFill
    public var alert: AppSymbol = .exclamationmarkTriangleFill
    public var infoCircle: AppSymbol = .infoCircle
    public var bell: AppSymbol = .bell
    public var bellBadgeFill: AppSymbol = .bellBadgeFill
    public var gearshape: AppSymbol = .gearshape

    public var heart: AppSymbol = .heart
    public var heartFill: AppSymbol = .heartFill
    public var heartSlash: AppSymbol = .heartSlash
    public var tv: AppSymbol = .tv
    public var tvSlash: AppSymbol = .tvSlash
    public var book: AppSymbol = .book
    public var bookFill: AppSymbol = .bookFill
    public var bookClosed: AppSymbol = .bookClosed
    public var bookmark: AppSymbol = .bookmark
    public var bookmarkFill: AppSymbol = .bookmarkFill
    public var tag: AppSymbol = .tag
    public var tray: AppSymbol = .tray
    public var globe: AppSymbol = .globe
    public var appleLogo: AppSymbol = .appleLogo
    public var envelope: AppSymbol = .envelope
    public var handRaised: AppSymbol = .handRaised

    public var person: AppSymbol = .person
    public var personCropCircle: AppSymbol = .personCropCircle
    public var personCropCircleBadgeExclamationmark: AppSymbol = .personCropCircleBadgeExclamationmark
    public var rectanglePortraitAndArrowRight: AppSymbol = .rectanglePortraitAndArrowRight

    public var squareGrid2x2: AppSymbol = .squareGrid2x2
    public var grid: AppSymbol = .squareGrid2x2
    public var listBullet: AppSymbol = .listBullet
    public var list: AppSymbol = .listBullet
    public var line3Horizontal: AppSymbol = .line3Horizontal
    public var options: AppSymbol = .line3Horizontal
    public var line3HorizontalCircleFill: AppSymbol = .line3HorizontalCircleFill
    public var menu: AppSymbol = .line3HorizontalCircleFill
    public var line3HorizontalDecrease: AppSymbol = .line3HorizontalDecrease
    public var line3HorizontalDecreaseCircle: AppSymbol = .line3HorizontalDecreaseCircle
    public var filter: AppSymbol = .line3HorizontalDecreaseCircle
    public var circleLefthalfFilled: AppSymbol = .circleLefthalfFilled
    public var circle: AppSymbol = .circle
    public var largecircleFillCircle: AppSymbol = .largecircleFillCircle

    public init() {}

    public static let `default` = SymbolTheme()
}

// MARK: - SwiftUI KeyPath Convenience Initializers

extension Image {
    /// Initialize with a direct keypath: `Image(\.crop)`
    public init(_ keyPath: KeyPath<SymbolTheme, AppSymbol>, theme: SymbolTheme = .default) {
        self.init(systemName: theme[keyPath: keyPath].systemName)
    }

    /// Initialize with explicit systemName keypath: `Image(systemName: \.cropSquare)`
    public init(systemName keyPath: KeyPath<SymbolTheme, AppSymbol>, theme: SymbolTheme = .default) {
        self.init(systemName: theme[keyPath: keyPath].systemName)
    }

    public init(symbol: AppSymbol) {
        self.init(systemName: symbol.systemName)
    }
}

extension Label where Title == Text, Icon == Image {
    /// Initialize with a direct keypath: `Label(title, \.crop)`
    public init<S>(_ title: S, _ keyPath: KeyPath<SymbolTheme, AppSymbol>, theme: SymbolTheme = .default) where S: StringProtocol {
        self.init(title, systemImage: theme[keyPath: keyPath].systemName)
    }

    public init(_ titleKey: LocalizedStringKey, _ keyPath: KeyPath<SymbolTheme, AppSymbol>, theme: SymbolTheme = .default) {
        self.init(titleKey, systemImage: theme[keyPath: keyPath].systemName)
    }

    /// Initialize with explicit systemImage keypath: `Label(title, systemImage: \.cropSquare)`
    public init<S>(_ title: S, systemImage keyPath: KeyPath<SymbolTheme, AppSymbol>, theme: SymbolTheme = .default) where S: StringProtocol {
        self.init(title, systemImage: theme[keyPath: keyPath].systemName)
    }

    public init(_ titleKey: LocalizedStringKey, systemImage keyPath: KeyPath<SymbolTheme, AppSymbol>, theme: SymbolTheme = .default) {
        self.init(titleKey, systemImage: theme[keyPath: keyPath].systemName)
    }

    public init(_ titleKey: LocalizedStringKey, symbol: AppSymbol) {
        self.init(titleKey, systemImage: symbol.systemName)
    }

    public init<S>(_ title: S, symbol: AppSymbol) where S: StringProtocol {
        self.init(title, systemImage: symbol.systemName)
    }
}

#if canImport(UIKit)
extension UIImage {
    /// Initialize with explicit systemName keypath: `UIImage(systemName: \.cropSquare)`
    public convenience init?(systemName keyPath: KeyPath<SymbolTheme, AppSymbol>, theme: SymbolTheme = .default) {
        self.init(systemName: theme[keyPath: keyPath].systemName)
    }

    /// Initialize with direct keypath: `UIImage(\.cropSquare)`
    public convenience init?(_ keyPath: KeyPath<SymbolTheme, AppSymbol>, theme: SymbolTheme = .default) {
        self.init(systemName: theme[keyPath: keyPath].systemName)
    }

    public convenience init?(symbol: AppSymbol) {
        self.init(systemName: symbol.systemName)
    }
}
#endif
