import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// Identifies applications across the portfolio for canonical branding and themes.
public enum AppBrand: String, CaseIterable, Identifiable, Sendable {
    case showBook = "ShowBook"
    case myTV = "myTV"
    case motivationDaily = "MotivationDaily"

    public var id: String { rawValue }

    public var palette: BrandPalette {
        BrandPalette.palette(for: self)
    }

    /// Automatically infers the active application brand from the main bundle identifier,
    /// defaulting to `.myTV` if no specific host pattern is matched.
    public static var current: AppBrand {
        let identifier = (Bundle.main.bundleIdentifier ?? "").lowercased()
        if identifier.contains("showbook") {
            return .showBook
        } else if identifier.contains("motivation") {
            return .motivationDaily
        } else {
            return .myTV
        }
    }
}

/// Canonical brand and auth color roles. DesignTokensKit owns runtime brand values.
public struct BrandPalette: Sendable, Equatable {
    /// Active brand palette inferred from the current application context.
    public static var current: BrandPalette {
        BrandPalette.palette(for: AppBrand.current)
    }
    public let action: Color
    public let onAction: Color
    public let background: Color
    public let surface: Color
    public let border: Color
    public let text: Color
    public let mutedText: Color
    public let error: Color
    public let warning: Color
    public let success: Color

    public let authAction: Color
    public let authOnAction: Color
    public let authBackground: Color
    public let authForeground: Color

    public init(
        action: Color,
        onAction: Color,
        background: Color,
        surface: Color,
        border: Color,
        text: Color,
        mutedText: Color,
        error: Color,
        warning: Color,
        success: Color,
        authAction: Color? = nil,
        authOnAction: Color? = nil,
        authBackground: Color? = nil,
        authForeground: Color? = nil
    ) {
        self.action = action
        self.onAction = onAction
        self.background = background
        self.surface = surface
        self.border = border
        self.text = text
        self.mutedText = mutedText
        self.error = error
        self.warning = warning
        self.success = success
        self.authAction = authAction ?? action
        self.authOnAction = authOnAction ?? onAction
        self.authBackground = authBackground ?? background
        self.authForeground = authForeground ?? text
    }

    public static func palette(for brand: AppBrand) -> BrandPalette {
        switch brand {
        case .showBook: return .showBook
        case .myTV: return .myTV
        case .motivationDaily: return .motivationDaily
        }
    }

    // MARK: - Canonical Palettes

    public static let showBook = BrandPalette(
        action: Color.dynamic(
            light: Color(.sRGB, red: 0.0, green: 0.023529411764705882, blue: 0.30980392156862746, opacity: 1.0),
            dark: Color(.sRGB, red: 0.6470588235294118, green: 0.7058823529411765, blue: 0.9882352941176471, opacity: 1.0)
        ),
        onAction: Color.dynamic(
            light: Color.white,
            dark: Color(.sRGB, red: 0.06666666666666667, green: 0.09411764705882353, blue: 0.15294117647058825, opacity: 1.0)
        ),
        background: Color.dynamic(
            light: Color(.sRGB, red: 0.9803921568627451, green: 0.9803921568627451, blue: 0.9686274509803922, opacity: 1.0),
            dark: Color(.sRGB, red: 0.043137254901960784, green: 0.07058823529411765, blue: 0.12549019607843137, opacity: 1.0)
        ),
        surface: Color.dynamic(
            light: Color.white,
            dark: Color(.sRGB, red: 0.08235294117647059, green: 0.08235294117647059, blue: 0.14901960784313725, opacity: 1.0)
        ),
        border: Color.dynamic(
            light: Color(.sRGB, red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8588235294117647, opacity: 1.0),
            dark: Color(.sRGB, red: 0.2784313725490196, green: 0.3333333333333333, blue: 0.4117647058823529, opacity: 1.0)
        ),
        text: Color.dynamic(
            light: Color(.sRGB, red: 0.06666666666666667, green: 0.09411764705882353, blue: 0.15294117647058825, opacity: 1.0),
            dark: Color(.sRGB, red: 0.9529411764705882, green: 0.9568627450980393, blue: 0.9647058823529412, opacity: 1.0)
        ),
        mutedText: Color.dynamic(
            light: Color(.sRGB, red: 0.29411764705882354, green: 0.3333333333333333, blue: 0.38823529411764707, opacity: 1.0),
            dark: Color(.sRGB, red: 0.796078431372549, green: 0.8352941176470589, blue: 0.8823529411764706, opacity: 1.0)
        ),
        error: Color.dynamic(
            light: Color(.sRGB, red: 0.7254901960784313, green: 0.10980392156862745, blue: 0.10980392156862745, opacity: 1.0),
            dark: Color(.sRGB, red: 0.9882352941176471, green: 0.6470588235294118, blue: 0.6470588235294118, opacity: 1.0)
        ),
        warning: Color.dynamic(
            light: Color(.sRGB, red: 0.5725490196078431, green: 0.25098039215686274, blue: 0.054901960784313725, opacity: 1.0),
            dark: Color(.sRGB, red: 0.9882352941176471, green: 0.8274509803921568, blue: 0.30196078431372547, opacity: 1.0)
        ),
        success: Color.dynamic(
            light: Color(.sRGB, red: 0.08627450980392157, green: 0.396078431372549, blue: 0.20392156862745098, opacity: 1.0),
            dark: Color(.sRGB, red: 0.5254901960784314, green: 0.9372549019607843, blue: 0.6745098039215687, opacity: 1.0)
        ),
        authBackground: Color.dynamic(
            light: Color.white,
            dark: Color(.sRGB, red: 0.043137254901960784, green: 0.07058823529411765, blue: 0.12549019607843137, opacity: 1.0)
        )
    )

    public static let myTV = BrandPalette(
        action: Color.dynamic(
            light: Color(.sRGB, red: 0.027450980392156862, green: 0.3843137254901961, blue: 0.6078431372549019, opacity: 1.0),
            dark: Color(.sRGB, red: 0.13333333333333333, green: 0.7137254901960784, blue: 0.792156862745098, opacity: 1.0)
        ),
        onAction: Color.dynamic(
            light: Color.white,
            dark: Color(.sRGB, red: 0.06666666666666667, green: 0.09411764705882353, blue: 0.15294117647058825, opacity: 1.0)
        ),
        background: Color.dynamic(
            light: Color(.sRGB, red: 0.9764705882352941, green: 0.9803921568627451, blue: 0.9882352941176471, opacity: 1.0),
            dark: Color(.sRGB, red: 0.047058823529411764, green: 0.06666666666666667, blue: 0.12156862745098039, opacity: 1.0)
        ),
        surface: Color.dynamic(
            light: Color.white,
            dark: Color(.sRGB, red: 0.08235294117647059, green: 0.11372549019607843, blue: 0.1803921568627451, opacity: 1.0)
        ),
        border: Color.dynamic(
            light: Color(.sRGB, red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8588235294117647, opacity: 1.0),
            dark: Color(.sRGB, red: 0.2784313725490196, green: 0.3333333333333333, blue: 0.4117647058823529, opacity: 1.0)
        ),
        text: Color.dynamic(
            light: Color(.sRGB, red: 0.06666666666666667, green: 0.09411764705882353, blue: 0.15294117647058825, opacity: 1.0),
            dark: Color(.sRGB, red: 0.9529411764705882, green: 0.9568627450980393, blue: 0.9647058823529412, opacity: 1.0)
        ),
        mutedText: Color.dynamic(
            light: Color(.sRGB, red: 0.29411764705882354, green: 0.3333333333333333, blue: 0.38823529411764707, opacity: 1.0),
            dark: Color(.sRGB, red: 0.796078431372549, green: 0.8352941176470589, blue: 0.8823529411764706, opacity: 1.0)
        ),
        error: Color.dynamic(
            light: Color(.sRGB, red: 0.7254901960784313, green: 0.10980392156862745, blue: 0.10980392156862745, opacity: 1.0),
            dark: Color(.sRGB, red: 0.9882352941176471, green: 0.6470588235294118, blue: 0.6470588235294118, opacity: 1.0)
        ),
        warning: Color.dynamic(
            light: Color(.sRGB, red: 0.5725490196078431, green: 0.25098039215686274, blue: 0.054901960784313725, opacity: 1.0),
            dark: Color(.sRGB, red: 0.9882352941176471, green: 0.8274509803921568, blue: 0.30196078431372547, opacity: 1.0)
        ),
        success: Color.dynamic(
            light: Color(.sRGB, red: 0.08627450980392157, green: 0.396078431372549, blue: 0.20392156862745098, opacity: 1.0),
            dark: Color(.sRGB, red: 0.5254901960784314, green: 0.9372549019607843, blue: 0.6745098039215687, opacity: 1.0)
        ),
        authBackground: Color.dynamic(
            light: Color.white,
            dark: Color(.sRGB, red: 0.047058823529411764, green: 0.06666666666666667, blue: 0.12156862745098039, opacity: 1.0)
        )
    )

    public static let motivationDaily = BrandPalette(
        action: Color.dynamic(
            light: Color(.sRGB, red: 0.7058823529411765, green: 0.3254901960784314, blue: 0.03529411764705882, opacity: 1.0),
            dark: Color(.sRGB, red: 0.984313725490196, green: 0.7490196078431373, blue: 0.1411764705882353, opacity: 1.0)
        ),
        onAction: Color.dynamic(
            light: Color.white,
            dark: Color(.sRGB, red: 0.06666666666666667, green: 0.09411764705882353, blue: 0.15294117647058825, opacity: 1.0)
        ),
        background: Color.dynamic(
            light: Color(.sRGB, red: 1.0, green: 0.984313725490196, blue: 0.9607843137254902, opacity: 1.0),
            dark: Color(.sRGB, red: 0.043137254901960784, green: 0.07058823529411765, blue: 0.12549019607843137, opacity: 1.0)
        ),
        surface: Color.dynamic(
            light: Color.white,
            dark: Color(.sRGB, red: 0.12156862745098039, green: 0.10196078431372549, blue: 0.08235294117647059, opacity: 1.0)
        ),
        border: Color.dynamic(
            light: Color(.sRGB, red: 0.8196078431372549, green: 0.8352941176470589, blue: 0.8588235294117647, opacity: 1.0),
            dark: Color(.sRGB, red: 0.2784313725490196, green: 0.3333333333333333, blue: 0.4117647058823529, opacity: 1.0)
        ),
        text: Color.dynamic(
            light: Color(.sRGB, red: 0.06666666666666667, green: 0.09411764705882353, blue: 0.15294117647058825, opacity: 1.0),
            dark: Color(.sRGB, red: 0.9529411764705882, green: 0.9568627450980393, blue: 0.9647058823529412, opacity: 1.0)
        ),
        mutedText: Color.dynamic(
            light: Color(.sRGB, red: 0.29411764705882354, green: 0.3333333333333333, blue: 0.38823529411764707, opacity: 1.0),
            dark: Color(.sRGB, red: 0.796078431372549, green: 0.8352941176470589, blue: 0.8823529411764706, opacity: 1.0)
        ),
        error: Color.dynamic(
            light: Color(.sRGB, red: 0.7254901960784313, green: 0.10980392156862745, blue: 0.10980392156862745, opacity: 1.0),
            dark: Color(.sRGB, red: 0.9882352941176471, green: 0.6470588235294118, blue: 0.6470588235294118, opacity: 1.0)
        ),
        warning: Color.dynamic(
            light: Color(.sRGB, red: 0.5725490196078431, green: 0.25098039215686274, blue: 0.054901960784313725, opacity: 1.0),
            dark: Color(.sRGB, red: 0.9882352941176471, green: 0.8274509803921568, blue: 0.30196078431372547, opacity: 1.0)
        ),
        success: Color.dynamic(
            light: Color(.sRGB, red: 0.08627450980392157, green: 0.396078431372549, blue: 0.20392156862745098, opacity: 1.0),
            dark: Color(.sRGB, red: 0.5254901960784314, green: 0.9372549019607843, blue: 0.6745098039215687, opacity: 1.0)
        ),
        authBackground: Color.dynamic(
            light: Color.white,
            dark: Color(.sRGB, red: 0.043137254901960784, green: 0.07058823529411765, blue: 0.12549019607843137, opacity: 1.0)
        )
    )
}

// MARK: - Placeholder Color Tokens

/// Canonical runtime placeholder styling; avoids inline RGB values in consumer apps.
public enum PlaceholderColorToken {
    public static let gradientStart = Color(.sRGB, red: 0.10, green: 0.12, blue: 0.22, opacity: 1.0)
    public static let gradientEnd = Color(.sRGB, red: 0.18, green: 0.30, blue: 0.42, opacity: 1.0)

    #if canImport(UIKit)
    public static let uiGradientStart = UIColor(red: 0.10, green: 0.12, blue: 0.22, alpha: 1.0)
    public static let uiGradientEnd = UIColor(red: 0.18, green: 0.30, blue: 0.42, alpha: 1.0)
    #endif
}

// MARK: - Dynamic Color Helpers

extension Color {
    public static func dynamic(light: Color, dark: Color) -> Color {
        #if canImport(UIKit)
        return Color(uiColor: UIColor { trait in
            trait.userInterfaceStyle == .dark ? UIColor(dark) : UIColor(light)
        })
        #elseif canImport(AppKit)
        return Color(nsColor: NSColor(name: nil, dynamicProvider: { appearance in
            appearance.bestMatch(from: [.darkAqua, .aqua]) == .darkAqua ? NSColor(dark) : NSColor(light)
        }))
        #else
        return light
        #endif
    }
}
