import SwiftUI

/// Canonical dynamic accent themes shared across client applications.
/// Centralizes accent selections, asset bindings, and ColorTheme keypaths.
public enum AccentTheme: String, CaseIterable, Identifiable, Sendable {
    case `default`
    case ocean
    case mint
    case sunset

    public static let storageKey = "accent_theme_selection"

    public var id: String { rawValue }

    public var displayName: String {
        switch self {
        case .default:
            return "Default"
        case .ocean:
            return "Ocean"
        case .mint:
            return "Mint"
        case .sunset:
            return "Sunset"
        }
    }

    public var colorKeyPath: KeyPath<ColorTheme, Color> {
        switch self {
        case .default:
            return \.accentColor
        case .ocean:
            return \.accentOcean
        case .mint:
            return \.accentMint
        case .sunset:
            return \.accentSunset
        }
    }

    public var color: Color {
        ColorTheme.default[keyPath: colorKeyPath]
    }

    public static func resolve(from rawValue: String) -> AccentTheme {
        AccentTheme(rawValue: rawValue) ?? .default
    }
}
