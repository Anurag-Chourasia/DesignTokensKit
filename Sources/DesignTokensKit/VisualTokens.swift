import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// Exact point primitives retained during extraction. Prefer semantic component metrics
/// (e.g. CatalogMetrics) when a value has a shared role; do not invent numeric literals in apps.
public enum DesignMetric {
    public static let p0: CGFloat = 0
    public static let p1: CGFloat = 1
    public static let p1_5: CGFloat = 1.5
    public static let p3: CGFloat = 3
    public static let p4: CGFloat = 4
    public static let p8: CGFloat = 8
    public static let p10: CGFloat = 10
    public static let p12: CGFloat = 12
    public static let p13: CGFloat = 13
    public static let p16: CGFloat = 16
    public static let p18: CGFloat = 18
    public static let p19: CGFloat = 19
    public static let p20: CGFloat = 20
    public static let p21: CGFloat = 21
    public static let p22_58: CGFloat = 22.58
    public static let p24: CGFloat = 24
    public static let p26_5: CGFloat = 26.5
    public static let p30: CGFloat = 30
    public static let p31: CGFloat = 31
    public static let p33: CGFloat = 33
    public static let p34: CGFloat = 34
    public static let p35: CGFloat = 35
    public static let p36: CGFloat = 36
    public static let p40: CGFloat = 40
    public static let p50: CGFloat = 50
    public static let p53: CGFloat = 53
    public static let p55: CGFloat = 55
    public static let p60: CGFloat = 60
    public static let p64: CGFloat = 64
    public static let p80: CGFloat = 80
    public static let p100: CGFloat = 100
    public static let p110: CGFloat = 110
    public static let p120: CGFloat = 120
    public static let p140: CGFloat = 140
    public static let p160: CGFloat = 160
    public static let p400: CGFloat = 400
}

public enum OpacityToken {
    public static let p0_05: Double = 0.05
    public static let p0_1: Double = 0.1
    public static let p0_15: Double = 0.15
    public static let p0_18: Double = 0.18
    public static let p0_2: Double = 0.2
    public static let p0_25: Double = 0.25
    public static let p0_3: Double = 0.3
    public static let p0_35: Double = 0.35
    public static let p0_4: Double = 0.4
    public static let p0_5: Double = 0.5
    public static let p0_55: Double = 0.55
    public static let p0_6: Double = 0.6
    public static let p0_7: Double = 0.7
    public static let p0_75: Double = 0.75
    public static let p0_8: Double = 0.8
    public static let p0_85: Double = 0.85
    public static let p0_9: Double = 0.9
    public static let p1_0: Double = 1.0
}

public enum ScaleToken {
    public static let p1_0: CGFloat = 1.0
    public static let p1_15: CGFloat = 1.15
}

public enum TextLineLimit {
    public static let p2: Int = 2
}

public enum Typography {
    public static let largeTitle: Font = .largeTitle
    public static let title: Font = .title
    public static let title2: Font = .title2
    public static let title3: Font = .title3
    public static let headline: Font = .headline
    public static let subheadline: Font = .subheadline
    public static let body: Font = .body
    public static let callout: Font = .callout
    public static let footnote: Font = .footnote
    public static let caption: Font = .caption
    public static let caption2: Font = .caption2
}

public enum DesignColor {
    public static let primary: Color = .primary
    public static let secondary: Color = .secondary
    public static let accentColor: Color = .accentColor
    public static let white: Color = .white
    public static let black: Color = .black
    public static let gray: Color = .gray
    public static let red: Color = .red
    public static let green: Color = .green
    public static let blue: Color = .blue
    public static let yellow: Color = .yellow
    public static let orange: Color = .orange
    public static let clear: Color = .clear
    public static let oceanAction = Color(.sRGB, red: 7.0 / 255, green: 98.0 / 255, blue: 155.0 / 255, opacity: 1)
    public static let turquoise = Color(.sRGB, red: 34.0 / 255, green: 182.0 / 255, blue: 202.0 / 255, opacity: 1)
    public static let ink = Color(.sRGB, red: 36.0 / 255, green: 46.0 / 255, blue: 61.0 / 255, opacity: 1)
    public static let lightBorder = Color(.sRGB, red: 218.0 / 255, green: 218.0 / 255, blue: 218.0 / 255, opacity: 1)
    #if canImport(UIKit)
    public static let grouped = Color(uiColor: .systemGroupedBackground)
    public static let groupedSecondary = Color(uiColor: .secondarySystemGroupedBackground)
    public static let separator = Color(uiColor: .separator)
    #else
    public static let grouped = Color(nsColor: .windowBackgroundColor)
    public static let groupedSecondary = Color(nsColor: .controlBackgroundColor)
    public static let separator = Color(nsColor: .separatorColor)
    #endif
}
