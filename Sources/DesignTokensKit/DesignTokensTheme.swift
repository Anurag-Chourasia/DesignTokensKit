import SwiftUI

// MARK: - Typography KeyPath Theme

public struct TypographyTheme: Sendable, Equatable {
    public let largeTitle: Font
    public let title: Font
    public let title2: Font
    public let title3: Font
    public let headline: Font
    public let subheadline: Font
    public let body: Font
    public let callout: Font
    public let footnote: Font
    public let caption: Font
    public let caption2: Font

    public init(
        largeTitle: Font = .largeTitle,
        title: Font = .title,
        title2: Font = .title2,
        title3: Font = .title3,
        headline: Font = .headline,
        subheadline: Font = .subheadline,
        body: Font = .body,
        callout: Font = .callout,
        footnote: Font = .footnote,
        caption: Font = .caption,
        caption2: Font = .caption2
    ) {
        self.largeTitle = largeTitle
        self.title = title
        self.title2 = title2
        self.title3 = title3
        self.headline = headline
        self.subheadline = subheadline
        self.body = body
        self.callout = callout
        self.footnote = footnote
        self.caption = caption
        self.caption2 = caption2
    }

    public static let `default` = TypographyTheme()
}

// MARK: - Spacing KeyPath Theme

public struct SpacingTheme: Sendable, Equatable {
    public let zero: CGFloat
    public let two: CGFloat
    public let four: CGFloat
    public let five: CGFloat
    public let six: CGFloat
    public let eight: CGFloat
    public let ten: CGFloat
    public let twelve: CGFloat
    public let fourteen: CGFloat
    public let sixteen: CGFloat
    public let eighteen: CGFloat
    public let twentyFour: CGFloat
    public let twenty: CGFloat
    public let thirty: CGFloat
    public let thirtyTwo: CGFloat

    public init(
        zero: CGFloat = Spacing.zero,
        two: CGFloat = Spacing.two,
        four: CGFloat = Spacing.four,
        five: CGFloat = Spacing.five,
        six: CGFloat = Spacing.six,
        eight: CGFloat = Spacing.eight,
        ten: CGFloat = Spacing.ten,
        twelve: CGFloat = Spacing.twelve,
        fourteen: CGFloat = Spacing.fourteen,
        sixteen: CGFloat = Spacing.sixteen,
        eighteen: CGFloat = Spacing.eighteen,
        twentyFour: CGFloat = Spacing.twentyFour,
        twenty: CGFloat = Spacing.twenty,
        thirty: CGFloat = Spacing.thirty,
        thirtyTwo: CGFloat = Spacing.thirtyTwo
    ) {
        self.zero = zero
        self.two = two
        self.four = four
        self.five = five
        self.six = six
        self.eight = eight
        self.ten = ten
        self.twelve = twelve
        self.fourteen = fourteen
        self.sixteen = sixteen
        self.eighteen = eighteen
        self.twentyFour = twentyFour
        self.twenty = twenty
        self.thirty = thirty
        self.thirtyTwo = thirtyTwo
    }

    public static let `default` = SpacingTheme()
}

// MARK: - StrokeWidth KeyPath Theme

public struct StrokeWidthTheme: Sendable, Equatable {
    public let one: CGFloat
    public let two: CGFloat

    public init(
        one: CGFloat = StrokeWidth.one,
        two: CGFloat = StrokeWidth.two
    ) {
        self.one = one
        self.two = two
    }

    public static let `default` = StrokeWidthTheme()
}

// MARK: - CornerRadius KeyPath Theme

public struct CornerRadiusTheme: Sendable, Equatable {
    public let four: CGFloat
    public let six: CGFloat
    public let eight: CGFloat
    public let ten: CGFloat
    public let twelve: CGFloat
    public let fourteen: CGFloat
    public let fifteen: CGFloat
    public let sixteen: CGFloat
    public let twenty: CGFloat
    public let thirty: CGFloat

    public init(
        four: CGFloat = CornerRadius.four,
        six: CGFloat = CornerRadius.six,
        eight: CGFloat = CornerRadius.eight,
        ten: CGFloat = CornerRadius.ten,
        twelve: CGFloat = CornerRadius.twelve,
        fourteen: CGFloat = CornerRadius.fourteen,
        fifteen: CGFloat = CornerRadius.fifteen,
        sixteen: CGFloat = CornerRadius.sixteen,
        twenty: CGFloat = CornerRadius.twenty,
        thirty: CGFloat = CornerRadius.thirty
    ) {
        self.four = four
        self.six = six
        self.eight = eight
        self.ten = ten
        self.twelve = twelve
        self.fourteen = fourteen
        self.fifteen = fifteen
        self.sixteen = sixteen
        self.twenty = twenty
        self.thirty = thirty
    }

    public static let `default` = CornerRadiusTheme()
}

// MARK: - DesignMetric KeyPath Theme

public struct DesignMetricTheme: Sendable, Equatable {
    public let p0: CGFloat
    public let p1: CGFloat
    public let p1_5: CGFloat
    public let p2: CGFloat
    public let p3: CGFloat
    public let p4: CGFloat
    public let p5: CGFloat
    public let p8: CGFloat
    public let p10: CGFloat
    public let p12: CGFloat
    public let p13: CGFloat
    public let p14: CGFloat
    public let p16: CGFloat
    public let p18: CGFloat
    public let p19: CGFloat
    public let p20: CGFloat
    public let p21: CGFloat
    public let p22_58: CGFloat
    public let p24: CGFloat
    public let p26_5: CGFloat
    public let p30: CGFloat
    public let p32: CGFloat
    public let p31: CGFloat
    public let p33: CGFloat
    public let p34: CGFloat
    public let p35: CGFloat
    public let p36: CGFloat
    public let p40: CGFloat
    public let p50: CGFloat
    public let p53: CGFloat
    public let p55: CGFloat
    public let p60: CGFloat
    public let p64: CGFloat
    public let p80: CGFloat
    public let p100: CGFloat
    public let p110: CGFloat
    public let p120: CGFloat
    public let p140: CGFloat
    public let p160: CGFloat
    public let p210: CGFloat
    public let p248: CGFloat
    public let p300: CGFloat
    public let p320: CGFloat
    public let p400: CGFloat

    public init(
        p0: CGFloat = DesignMetric.p0,
        p1: CGFloat = DesignMetric.p1,
        p1_5: CGFloat = DesignMetric.p1_5,
        p2: CGFloat = DesignMetric.p2,
        p3: CGFloat = DesignMetric.p3,
        p4: CGFloat = DesignMetric.p4,
        p5: CGFloat = DesignMetric.p5,
        p8: CGFloat = DesignMetric.p8,
        p10: CGFloat = DesignMetric.p10,
        p12: CGFloat = DesignMetric.p12,
        p13: CGFloat = DesignMetric.p13,
        p14: CGFloat = DesignMetric.p14,
        p16: CGFloat = DesignMetric.p16,
        p18: CGFloat = DesignMetric.p18,
        p19: CGFloat = DesignMetric.p19,
        p20: CGFloat = DesignMetric.p20,
        p21: CGFloat = DesignMetric.p21,
        p22_58: CGFloat = DesignMetric.p22_58,
        p24: CGFloat = DesignMetric.p24,
        p26_5: CGFloat = DesignMetric.p26_5,
        p30: CGFloat = DesignMetric.p30,
        p32: CGFloat = DesignMetric.p32,
        p31: CGFloat = DesignMetric.p31,
        p33: CGFloat = DesignMetric.p33,
        p34: CGFloat = DesignMetric.p34,
        p35: CGFloat = DesignMetric.p35,
        p36: CGFloat = DesignMetric.p36,
        p40: CGFloat = DesignMetric.p40,
        p50: CGFloat = DesignMetric.p50,
        p53: CGFloat = DesignMetric.p53,
        p55: CGFloat = DesignMetric.p55,
        p60: CGFloat = DesignMetric.p60,
        p64: CGFloat = DesignMetric.p64,
        p80: CGFloat = DesignMetric.p80,
        p100: CGFloat = DesignMetric.p100,
        p110: CGFloat = DesignMetric.p110,
        p120: CGFloat = DesignMetric.p120,
        p140: CGFloat = DesignMetric.p140,
        p160: CGFloat = DesignMetric.p160,
        p210: CGFloat = DesignMetric.p210,
        p248: CGFloat = DesignMetric.p248,
        p300: CGFloat = DesignMetric.p300,
        p320: CGFloat = DesignMetric.p320,
        p400: CGFloat = DesignMetric.p400
    ) {
        self.p0 = p0
        self.p1 = p1
        self.p1_5 = p1_5
        self.p2 = p2
        self.p3 = p3
        self.p4 = p4
        self.p5 = p5
        self.p8 = p8
        self.p10 = p10
        self.p12 = p12
        self.p13 = p13
        self.p14 = p14
        self.p16 = p16
        self.p18 = p18
        self.p19 = p19
        self.p20 = p20
        self.p21 = p21
        self.p22_58 = p22_58
        self.p24 = p24
        self.p26_5 = p26_5
        self.p30 = p30
        self.p32 = p32
        self.p31 = p31
        self.p33 = p33
        self.p34 = p34
        self.p35 = p35
        self.p36 = p36
        self.p40 = p40
        self.p50 = p50
        self.p53 = p53
        self.p55 = p55
        self.p60 = p60
        self.p64 = p64
        self.p80 = p80
        self.p100 = p100
        self.p110 = p110
        self.p120 = p120
        self.p140 = p140
        self.p160 = p160
        self.p210 = p210
        self.p248 = p248
        self.p300 = p300
        self.p320 = p320
        self.p400 = p400
    }

    public static let `default` = DesignMetricTheme()
}

// MARK: - Opacity KeyPath Theme

public struct OpacityTheme: Sendable, Equatable {
    public let p0_05: Double
    public let p0_1: Double
    public let p0_15: Double
    public let p0_18: Double
    public let p0_2: Double
    public let p0_25: Double
    public let p0_3: Double
    public let p0_35: Double
    public let p0_4: Double
    public let p0_5: Double
    public let p0_55: Double
    public let p0_6: Double
    public let p0_7: Double
    public let p0_75: Double
    public let p0_8: Double
    public let p0_85: Double
    public let p0_9: Double
    public let p1_0: Double

    public init(
        p0_05: Double = OpacityToken.p0_05,
        p0_1: Double = OpacityToken.p0_1,
        p0_15: Double = OpacityToken.p0_15,
        p0_18: Double = OpacityToken.p0_18,
        p0_2: Double = OpacityToken.p0_2,
        p0_25: Double = OpacityToken.p0_25,
        p0_3: Double = OpacityToken.p0_3,
        p0_35: Double = OpacityToken.p0_35,
        p0_4: Double = OpacityToken.p0_4,
        p0_5: Double = OpacityToken.p0_5,
        p0_55: Double = OpacityToken.p0_55,
        p0_6: Double = OpacityToken.p0_6,
        p0_7: Double = OpacityToken.p0_7,
        p0_75: Double = OpacityToken.p0_75,
        p0_8: Double = OpacityToken.p0_8,
        p0_85: Double = OpacityToken.p0_85,
        p0_9: Double = OpacityToken.p0_9,
        p1_0: Double = OpacityToken.p1_0
    ) {
        self.p0_05 = p0_05
        self.p0_1 = p0_1
        self.p0_15 = p0_15
        self.p0_18 = p0_18
        self.p0_2 = p0_2
        self.p0_25 = p0_25
        self.p0_3 = p0_3
        self.p0_35 = p0_35
        self.p0_4 = p0_4
        self.p0_5 = p0_5
        self.p0_55 = p0_55
        self.p0_6 = p0_6
        self.p0_7 = p0_7
        self.p0_75 = p0_75
        self.p0_8 = p0_8
        self.p0_85 = p0_85
        self.p0_9 = p0_9
        self.p1_0 = p1_0
    }

    public static let `default` = OpacityTheme()
}

// MARK: - Color KeyPath Theme

public struct ColorTheme: Sendable, Equatable {
    public var primary: Color
    public var secondary: Color
    public var accentColor: Color
    public var white: Color
    public var black: Color
    public var gray: Color
    public var red: Color
    public var green: Color
    public var blue: Color
    public var yellow: Color
    public var orange: Color
    public var clear: Color
    public var oceanAction: Color
    public var turquoise: Color
    public var ink: Color
    public var lightBorder: Color
    public var grouped: Color
    public var groupedSecondary: Color
    public var separator: Color
    public var accentOcean: Color
    public var accentMint: Color
    public var accentSunset: Color

    public init(
        primary: Color = DesignColor.primary,
        secondary: Color = DesignColor.secondary,
        accentColor: Color = DesignColor.accentColor,
        white: Color = DesignColor.white,
        black: Color = DesignColor.black,
        gray: Color = DesignColor.gray,
        red: Color = DesignColor.red,
        green: Color = DesignColor.green,
        blue: Color = DesignColor.blue,
        yellow: Color = DesignColor.yellow,
        orange: Color = DesignColor.orange,
        clear: Color = DesignColor.clear,
        oceanAction: Color = DesignColor.oceanAction,
        turquoise: Color = DesignColor.turquoise,
        ink: Color = DesignColor.ink,
        lightBorder: Color = DesignColor.lightBorder,
        grouped: Color = DesignColor.grouped,
        groupedSecondary: Color = DesignColor.groupedSecondary,
        separator: Color = DesignColor.separator,
        accentOcean: Color = DesignColor.accentOcean,
        accentMint: Color = DesignColor.accentMint,
        accentSunset: Color = DesignColor.accentSunset
    ) {
        self.primary = primary
        self.secondary = secondary
        self.accentColor = accentColor
        self.white = white
        self.black = black
        self.gray = gray
        self.red = red
        self.green = green
        self.blue = blue
        self.yellow = yellow
        self.orange = orange
        self.clear = clear
        self.oceanAction = oceanAction
        self.turquoise = turquoise
        self.ink = ink
        self.lightBorder = lightBorder
        self.grouped = grouped
        self.groupedSecondary = groupedSecondary
        self.separator = separator
        self.accentOcean = accentOcean
        self.accentMint = accentMint
        self.accentSunset = accentSunset
    }

    public static let `default` = ColorTheme()
}

// MARK: - Root DesignTokensTheme

public struct DesignTokensTheme: Sendable, Equatable {
    public var typography: TypographyTheme
    public var spacing: SpacingTheme
    public var strokeWidth: StrokeWidthTheme
    public var cornerRadius: CornerRadiusTheme
    public var metric: DesignMetricTheme
    public var opacity: OpacityTheme
    public var symbols: SymbolTheme
    public var colors: ColorTheme

    public init(
        typography: TypographyTheme = .default,
        spacing: SpacingTheme = .default,
        strokeWidth: StrokeWidthTheme = .default,
        cornerRadius: CornerRadiusTheme = .default,
        metric: DesignMetricTheme = .default,
        opacity: OpacityTheme = .default,
        symbols: SymbolTheme = .default,
        colors: ColorTheme = .default
    ) {
        self.typography = typography
        self.spacing = spacing
        self.strokeWidth = strokeWidth
        self.cornerRadius = cornerRadius
        self.metric = metric
        self.opacity = opacity
        self.symbols = symbols
        self.colors = colors
    }

    public static let `default` = DesignTokensTheme()
}

// MARK: - SwiftUI Environment Integration

private struct DesignTokensThemeKey: EnvironmentKey {
    static let defaultValue: DesignTokensTheme = .default
}

extension EnvironmentValues {
    public var designTokens: DesignTokensTheme {
        get { self[DesignTokensThemeKey.self] }
        set { self[DesignTokensThemeKey.self] = newValue }
    }
}

// MARK: - View Modifiers for KeyPath-Based Styling (SwiftUI Overloads)

extension View {
    /// Overload standard SwiftUI `font` modifier using a TypographyTheme keypath: `.font(\.caption2)`
    public func font(_ keyPath: KeyPath<TypographyTheme, Font>) -> some View {
        self.modifier(TokenFontModifier(keyPath: keyPath))
    }

    /// Overload standard SwiftUI `font` modifier using a DesignMetricTheme size keypath: `.font(size: \.p60)`
    public func font(
        size: KeyPath<DesignMetricTheme, CGFloat>,
        weight: Font.Weight = .regular,
        design: Font.Design = .default,
        theme: DesignMetricTheme = .default
    ) -> some View {
        self.font(.system(size: theme[keyPath: size], weight: weight, design: design))
    }

    /// Overload standard SwiftUI `padding` modifier using a SpacingTheme keypath: `.padding(\.eight)` or `.padding(.horizontal, \.eight)`
    public func padding(_ edges: Edge.Set = .all, _ keyPath: KeyPath<SpacingTheme, CGFloat>) -> some View {
        self.modifier(TokenPaddingModifier(edges: edges, keyPath: keyPath))
    }

    public func padding(_ keyPath: KeyPath<SpacingTheme, CGFloat>) -> some View {
        self.modifier(TokenPaddingModifier(edges: .all, keyPath: keyPath))
    }

    /// Overload standard SwiftUI `padding` modifier using a DesignMetricTheme keypath: `.padding(\.p16)` or `.padding(.horizontal, \.p10)`
    public func padding(_ edges: Edge.Set = .all, _ keyPath: KeyPath<DesignMetricTheme, CGFloat>) -> some View {
        self.modifier(TokenMetricPaddingModifier(edges: edges, keyPath: keyPath))
    }

    public func padding(_ keyPath: KeyPath<DesignMetricTheme, CGFloat>) -> some View {
        self.modifier(TokenMetricPaddingModifier(edges: .all, keyPath: keyPath))
    }

    /// Overload standard SwiftUI `opacity` modifier using an OpacityTheme keypath: `.opacity(\.p0_8)`
    public func opacity(_ keyPath: KeyPath<OpacityTheme, Double>) -> some View {
        self.modifier(TokenOpacityModifier(keyPath: keyPath))
    }

    /// Overload standard SwiftUI `cornerRadius` modifier using a CornerRadiusTheme keypath: `.cornerRadius(\.twelve)`
    public func cornerRadius(_ keyPath: KeyPath<CornerRadiusTheme, CGFloat>) -> some View {
        self.modifier(TokenCornerRadiusModifier(keyPath: keyPath))
    }

    /// Overload standard SwiftUI `cornerRadius` modifier using a DesignMetricTheme keypath: `.cornerRadius(\.p8)`
    public func cornerRadius(_ keyPath: KeyPath<DesignMetricTheme, CGFloat>) -> some View {
        self.modifier(TokenMetricCornerRadiusModifier(keyPath: keyPath))
    }

    /// Overload standard SwiftUI `foregroundColor` modifier using a ColorTheme keypath: `.foregroundColor(\.white)`
    public func foregroundColor(_ keyPath: KeyPath<ColorTheme, Color>, opacity: KeyPath<OpacityTheme, Double>? = nil) -> some View {
        self.modifier(TokenForegroundColorModifier(keyPath: keyPath, opacity: opacity))
    }

    /// Overload standard SwiftUI `tint` modifier using a ColorTheme keypath: `.tint(\.white)`
    public func tint(_ keyPath: KeyPath<ColorTheme, Color>, opacity: KeyPath<OpacityTheme, Double>? = nil) -> some View {
        self.modifier(TokenTintModifier(keyPath: keyPath, opacity: opacity))
    }

    /// Overload standard SwiftUI `background` color modifier using a ColorTheme keypath: `.background(\.grouped)`
    public func background(_ keyPath: KeyPath<ColorTheme, Color>, opacity: KeyPath<OpacityTheme, Double>? = nil) -> some View {
        self.modifier(TokenBackgroundColorModifier(keyPath: keyPath, opacity: opacity, ignoresSafeAreaEdges: nil))
    }

    /// Overload standard SwiftUI `background` color modifier with safe area ignoring support: `.background(\.black, ignoresSafeAreaEdges: .all)`
    public func background(
        _ keyPath: KeyPath<ColorTheme, Color>,
        opacity: KeyPath<OpacityTheme, Double>? = nil,
        ignoresSafeAreaEdges edges: Edge.Set?
    ) -> some View {
        self.modifier(TokenBackgroundColorModifier(keyPath: keyPath, opacity: opacity, ignoresSafeAreaEdges: edges))
    }

    /// Overload standard SwiftUI `shadow` modifier using theme keypaths: `.shadow(color: \.black, opacity: \.p0_1, radius: \.ten, y: \.five)`
    public func shadow(
        color: KeyPath<ColorTheme, Color>,
        opacity: KeyPath<OpacityTheme, Double>? = nil,
        radius: KeyPath<SpacingTheme, CGFloat>,
        x: CGFloat = 0,
        y: KeyPath<SpacingTheme, CGFloat>? = nil,
        colorTheme: ColorTheme = .default,
        opacityTheme: OpacityTheme = .default,
        spacingTheme: SpacingTheme = .default
    ) -> some View {
        let base = colorTheme[keyPath: color]
        let resolved = opacity.map { base.opacity(opacityTheme[keyPath: $0]) } ?? base
        let resolvedY: CGFloat = y.map { spacingTheme[keyPath: $0] } ?? 0
        return self.shadow(color: resolved, radius: spacingTheme[keyPath: radius], x: x, y: resolvedY)
    }

    /// Overload standard SwiftUI `lineSpacing` modifier using a DesignMetricTheme keypath: `.lineSpacing(\.p3)`
    public func lineSpacing(_ keyPath: KeyPath<DesignMetricTheme, CGFloat>, theme: DesignMetricTheme = .default) -> some View {
        self.lineSpacing(theme[keyPath: keyPath])
    }

    /// Overload standard SwiftUI `frame` modifier using DesignMetricTheme keypaths
    public func frame(
        width: KeyPath<DesignMetricTheme, CGFloat>? = nil,
        height: KeyPath<DesignMetricTheme, CGFloat>? = nil,
        alignment: Alignment = .center,
        theme: DesignMetricTheme = .default
    ) -> some View {
        self.frame(
            width: width.map { theme[keyPath: $0] },
            height: height.map { theme[keyPath: $0] },
            alignment: alignment
        )
    }

    /// Overload standard SwiftUI `frame` with min/ideal/max constraints using DesignMetricTheme keypaths
    public func frame(
        minWidth: KeyPath<DesignMetricTheme, CGFloat>? = nil,
        idealWidth: KeyPath<DesignMetricTheme, CGFloat>? = nil,
        maxWidth: KeyPath<DesignMetricTheme, CGFloat>? = nil,
        minHeight: KeyPath<DesignMetricTheme, CGFloat>? = nil,
        idealHeight: KeyPath<DesignMetricTheme, CGFloat>? = nil,
        maxHeight: KeyPath<DesignMetricTheme, CGFloat>? = nil,
        alignment: Alignment = .center,
        theme: DesignMetricTheme = .default
    ) -> some View {
        self.frame(
            minWidth: minWidth.map { theme[keyPath: $0] },
            idealWidth: idealWidth.map { theme[keyPath: $0] },
            maxWidth: maxWidth.map { theme[keyPath: $0] },
            minHeight: minHeight.map { theme[keyPath: $0] },
            idealHeight: idealHeight.map { theme[keyPath: $0] },
            maxHeight: maxHeight.map { theme[keyPath: $0] },
            alignment: alignment
        )
    }

    /// Overload standard SwiftUI `minimumScaleFactor` modifier using an OpacityTheme keypath: `.minimumScaleFactor(\.p0_6)`
    public func minimumScaleFactor(_ keyPath: KeyPath<OpacityTheme, Double>, theme: OpacityTheme = .default) -> some View {
        self.minimumScaleFactor(theme[keyPath: keyPath])
    }

    // Backwards-compatible aliases
    @available(*, deprecated, renamed: "font(_:)")
    public func tokenFont(_ keyPath: KeyPath<TypographyTheme, Font>) -> some View {
        self.font(keyPath)
    }

    @available(*, deprecated, renamed: "padding(_:_:)")
    public func tokenPadding(_ edges: Edge.Set = .all, _ keyPath: KeyPath<SpacingTheme, CGFloat>) -> some View {
        self.padding(edges, keyPath)
    }

    @available(*, deprecated, renamed: "opacity(_:)")
    public func tokenOpacity(_ keyPath: KeyPath<OpacityTheme, Double>) -> some View {
        self.opacity(keyPath)
    }

    @available(*, deprecated, renamed: "cornerRadius(_:)")
    public func tokenCornerRadius(_ keyPath: KeyPath<CornerRadiusTheme, CGFloat>) -> some View {
        self.cornerRadius(keyPath)
    }
}

private struct TokenFontModifier: ViewModifier {
    @Environment(\.designTokens) private var theme
    let keyPath: KeyPath<TypographyTheme, Font>

    func body(content: Content) -> some View {
        content.font(theme.typography[keyPath: keyPath])
    }
}

private struct TokenPaddingModifier: ViewModifier {
    @Environment(\.designTokens) private var theme
    let edges: Edge.Set
    let keyPath: KeyPath<SpacingTheme, CGFloat>

    func body(content: Content) -> some View {
        content.padding(edges, theme.spacing[keyPath: keyPath])
    }
}

private struct TokenMetricPaddingModifier: ViewModifier {
    @Environment(\.designTokens) private var theme
    let edges: Edge.Set
    let keyPath: KeyPath<DesignMetricTheme, CGFloat>

    func body(content: Content) -> some View {
        content.padding(edges, theme.metric[keyPath: keyPath])
    }
}

private struct TokenOpacityModifier: ViewModifier {
    @Environment(\.designTokens) private var theme
    let keyPath: KeyPath<OpacityTheme, Double>

    func body(content: Content) -> some View {
        content.opacity(theme.opacity[keyPath: keyPath])
    }
}

private struct TokenCornerRadiusModifier: ViewModifier {
    @Environment(\.designTokens) private var theme
    let keyPath: KeyPath<CornerRadiusTheme, CGFloat>

    func body(content: Content) -> some View {
        content.cornerRadius(theme.cornerRadius[keyPath: keyPath])
    }
}

private struct TokenMetricCornerRadiusModifier: ViewModifier {
    @Environment(\.designTokens) private var theme
    let keyPath: KeyPath<DesignMetricTheme, CGFloat>

    func body(content: Content) -> some View {
        content.cornerRadius(theme.metric[keyPath: keyPath])
    }
}

private struct TokenForegroundColorModifier: ViewModifier {
    @Environment(\.designTokens) private var theme
    let keyPath: KeyPath<ColorTheme, Color>
    let opacity: KeyPath<OpacityTheme, Double>?

    func body(content: Content) -> some View {
        let base = theme.colors[keyPath: keyPath]
        let resolved = opacity.map { base.opacity(theme.opacity[keyPath: $0]) } ?? base
        content.foregroundColor(resolved)
    }
}

private struct TokenTintModifier: ViewModifier {
    @Environment(\.designTokens) private var theme
    let keyPath: KeyPath<ColorTheme, Color>
    let opacity: KeyPath<OpacityTheme, Double>?

    func body(content: Content) -> some View {
        let base = theme.colors[keyPath: keyPath]
        let resolved = opacity.map { base.opacity(theme.opacity[keyPath: $0]) } ?? base
        content.tint(resolved)
    }
}

private struct TokenBackgroundColorModifier: ViewModifier {
    @Environment(\.designTokens) private var theme
    let keyPath: KeyPath<ColorTheme, Color>
    let opacity: KeyPath<OpacityTheme, Double>?
    let ignoresSafeAreaEdges: Edge.Set?

    func body(content: Content) -> some View {
        let base = theme.colors[keyPath: keyPath]
        let resolved = opacity.map { base.opacity(theme.opacity[keyPath: $0]) } ?? base
        if let edges = ignoresSafeAreaEdges {
            content.background(resolved.ignoresSafeArea(edges: edges))
        } else {
            content.background(resolved)
        }
    }
}

// MARK: - Shape KeyPath Styling

extension Shape {
    /// Fill a Shape with a ColorTheme keypath and optional OpacityTheme keypath
    public func fill(
        _ colorKeyPath: KeyPath<ColorTheme, Color>,
        opacity: KeyPath<OpacityTheme, Double>? = nil,
        colorTheme: ColorTheme = .default,
        opacityTheme: OpacityTheme = .default
    ) -> some View {
        let base = colorTheme[keyPath: colorKeyPath]
        let resolved = opacity.map { base.opacity(opacityTheme[keyPath: $0]) } ?? base
        return self.fill(resolved)
    }

    /// Stroke a Shape with a ColorTheme keypath, optional OpacityTheme keypath, and StrokeWidthTheme keypath
    public func stroke(
        _ colorKeyPath: KeyPath<ColorTheme, Color>,
        opacity: KeyPath<OpacityTheme, Double>? = nil,
        lineWidth: KeyPath<StrokeWidthTheme, CGFloat> = \.one,
        colorTheme: ColorTheme = .default,
        opacityTheme: OpacityTheme = .default,
        strokeWidthTheme: StrokeWidthTheme = .default
    ) -> some View {
        let base = colorTheme[keyPath: colorKeyPath]
        let resolved = opacity.map { base.opacity(opacityTheme[keyPath: $0]) } ?? base
        return self.stroke(resolved, lineWidth: strokeWidthTheme[keyPath: lineWidth])
    }
}

// MARK: - RoundedRectangle KeyPath Overload

extension RoundedRectangle {
    /// Initialize RoundedRectangle using CornerRadiusTheme keypath: `RoundedRectangle(cornerRadius: \.twelve)`
    public init(
        cornerRadius: KeyPath<CornerRadiusTheme, CGFloat>,
        style: RoundedCornerStyle = .continuous,
        theme: CornerRadiusTheme = .default
    ) {
        self.init(cornerRadius: theme[keyPath: cornerRadius], style: style)
    }
}

// MARK: - LinearGradient Theme Overloads

public struct ThemeColorStop: @unchecked Sendable, Equatable {
    public let color: KeyPath<ColorTheme, Color>
    public let opacity: KeyPath<OpacityTheme, Double>?

    public init(_ color: KeyPath<ColorTheme, Color>, opacity: KeyPath<OpacityTheme, Double>? = nil) {
        self.color = color
        self.opacity = opacity
    }
}

extension LinearGradient {
    /// Initialize LinearGradient using ColorTheme keypaths: `LinearGradient(themeColors: [\.oceanAction, \.blue], ...)`
    public init(
        themeColors: [KeyPath<ColorTheme, Color>],
        startPoint: UnitPoint,
        endPoint: UnitPoint,
        theme: ColorTheme = .default
    ) {
        self.init(colors: themeColors.map { theme[keyPath: $0] }, startPoint: startPoint, endPoint: endPoint)
    }

    /// Initialize LinearGradient using ThemeColorStop entries with optional opacities
    public init(
        stops: [ThemeColorStop],
        startPoint: UnitPoint,
        endPoint: UnitPoint,
        colorTheme: ColorTheme = .default,
        opacityTheme: OpacityTheme = .default
    ) {
        let resolvedColors = stops.map { stop -> Color in
            let base = colorTheme[keyPath: stop.color]
            if let op = stop.opacity {
                return base.opacity(opacityTheme[keyPath: op])
            }
            return base
        }
        self.init(colors: resolvedColors, startPoint: startPoint, endPoint: endPoint)
    }
}

// MARK: - Layout Container Overloads for KeyPath Spacing

extension VStack {
    /// Overload standard VStack with SpacingTheme keypath: `VStack(spacing: \.six) { ... }`
    public init(
        alignment: HorizontalAlignment = .center,
        spacing: KeyPath<SpacingTheme, CGFloat>,
        @ViewBuilder content: () -> Content
    ) {
        self.init(alignment: alignment, spacing: SpacingTheme.default[keyPath: spacing], content: content)
    }

    @available(*, deprecated, renamed: "init(alignment:spacing:content:)")
    public init(
        alignment: HorizontalAlignment = .center,
        spacingKeyPath: KeyPath<SpacingTheme, CGFloat>,
        @ViewBuilder content: () -> Content
    ) {
        self.init(alignment: alignment, spacing: spacingKeyPath, content: content)
    }
}

extension HStack {
    /// Overload standard HStack with SpacingTheme keypath: `HStack(spacing: \.ten) { ... }`
    public init(
        alignment: VerticalAlignment = .center,
        spacing: KeyPath<SpacingTheme, CGFloat>,
        @ViewBuilder content: () -> Content
    ) {
        self.init(alignment: alignment, spacing: SpacingTheme.default[keyPath: spacing], content: content)
    }

    @available(*, deprecated, renamed: "init(alignment:spacing:content:)")
    public init(
        alignment: VerticalAlignment = .center,
        spacingKeyPath: KeyPath<SpacingTheme, CGFloat>,
        @ViewBuilder content: () -> Content
    ) {
        self.init(alignment: alignment, spacing: spacingKeyPath, content: content)
    }
}

extension LazyVStack {
    /// Overload LazyVStack with SpacingTheme keypath: `LazyVStack(spacing: \.twelve) { ... }`
    public init(
        alignment: HorizontalAlignment = .center,
        spacing: KeyPath<SpacingTheme, CGFloat>,
        pinnedViews: PinnedScrollableViews = .init(),
        @ViewBuilder content: () -> Content
    ) {
        self.init(alignment: alignment, spacing: SpacingTheme.default[keyPath: spacing], pinnedViews: pinnedViews, content: content)
    }
}

extension LazyHStack {
    /// Overload LazyHStack with SpacingTheme keypath: `LazyHStack(spacing: \.twelve) { ... }`
    public init(
        alignment: VerticalAlignment = .center,
        spacing: KeyPath<SpacingTheme, CGFloat>,
        pinnedViews: PinnedScrollableViews = .init(),
        @ViewBuilder content: () -> Content
    ) {
        self.init(alignment: alignment, spacing: SpacingTheme.default[keyPath: spacing], pinnedViews: pinnedViews, content: content)
    }
}

extension LazyVGrid {
    /// Overload LazyVGrid with SpacingTheme keypath: `LazyVGrid(columns: [...], spacing: \.twelve) { ... }`
    public init(
        columns: [GridItem],
        alignment: HorizontalAlignment = .center,
        spacing: KeyPath<SpacingTheme, CGFloat>,
        pinnedViews: PinnedScrollableViews = .init(),
        @ViewBuilder content: () -> Content
    ) {
        self.init(columns: columns, alignment: alignment, spacing: SpacingTheme.default[keyPath: spacing], pinnedViews: pinnedViews, content: content)
    }
}

extension LazyHGrid {
    /// Overload LazyHGrid with SpacingTheme keypath: `LazyHGrid(rows: [...], spacing: \.twelve) { ... }`
    public init(
        rows: [GridItem],
        alignment: VerticalAlignment = .center,
        spacing: KeyPath<SpacingTheme, CGFloat>,
        pinnedViews: PinnedScrollableViews = .init(),
        @ViewBuilder content: () -> Content
    ) {
        self.init(rows: rows, alignment: alignment, spacing: SpacingTheme.default[keyPath: spacing], pinnedViews: pinnedViews, content: content)
    }
}

extension GridItem {
    /// Overload GridItem with SpacingTheme keypath: `GridItem(.adaptive(...), spacing: \.twelve)`
    public init(
        _ size: GridItem.Size = .flexible(),
        spacing: KeyPath<SpacingTheme, CGFloat>,
        alignment: Alignment? = nil
    ) {
        self.init(size, spacing: SpacingTheme.default[keyPath: spacing], alignment: alignment)
    }
}
