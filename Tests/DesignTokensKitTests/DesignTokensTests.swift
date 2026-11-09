import SwiftUI
import XCTest
import DesignTokensKit

final class DesignTokensTests: XCTestCase {
    func testCompactTilePresetsRetainBothGeometryVariants() {
        let regular = CatalogTileMetrics.compactGrid(accessibility: false)
        let accessible = CatalogTileMetrics.compactGrid(accessibility: true)
        XCTAssertEqual(regular.width, 120)
        XCTAssertEqual(regular.contentWidth, 110)
        XCTAssertEqual(accessible.width, 160)
        XCTAssertEqual(accessible.minimumHeight, 170)
        XCTAssertEqual(CatalogMetrics.coverListSize, CGSize(width: 60, height: 100))
        XCTAssertNil(Spacing.system)
    }

    func testExactPrimitivesAndDefaultInsets() {
        XCTAssertEqual([Spacing.eight, Spacing.twelve, Spacing.sixteen, Spacing.twenty], [8, 12, 16, 20])
        XCTAssertEqual(SurfaceMetrics().padding, EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        XCTAssertEqual(ButtonMetrics().minimumHeight, 44)
        XCTAssertEqual(ButtonMetrics().minimumWidth, 44)
    }

    func testIconPaddingDistinguishesSystemDefaultFromExplicitZero() {
        XCTAssertNil(IconMetrics().padding)
        let metrics = IconMetrics(size: CGSize(width: 21, height: 19), padding: 0)
        XCTAssertEqual(metrics.size, CGSize(width: 21, height: 19))
        XCTAssertEqual(metrics.padding, 0)
        XCTAssertEqual(ButtonMetrics().minimumHeight, TouchTarget.minimum)
    }

    func testBespokeGeometryIsNotRoundedOrNormalized() {
        let insets = EdgeInsets(top: 16, leading: 23, bottom: 16, trailing: 23)
        let metrics = SurfaceMetrics(padding: insets, cornerRadius: 26.5, borderWidth: 1)
        XCTAssertEqual(metrics.padding, insets)
        XCTAssertEqual(metrics.cornerRadius, 26.5)
        XCTAssertEqual(metrics.borderWidth, 1)
        XCTAssertEqual(ButtonMetrics(cornerRadius: 26.5).cornerRadius, 26.5)
    }

    func testThemeOverridesAreIndependentValues() {
        let original = SemanticColors()
        var customized = original
        customized.surface = .white
        customized.action = .blue
        customized.onAction = .white
        XCTAssertEqual(original.surface, .clear)
        XCTAssertEqual(original.foreground, .primary)
        XCTAssertEqual(customized.surface, .white)
        XCTAssertEqual(customized.action, .blue)
        XCTAssertEqual(customized.onAction, .white)
    }

    @MainActor
    func testSemanticColorsResolveInRenderingEnvironment() {
        let colors = SemanticColors(foreground: .primary)
        var light = EnvironmentValues()
        light.colorScheme = .light
        var dark = EnvironmentValues()
        dark.colorScheme = .dark
        XCTAssertEqual(colors.foreground.resolve(in: light), Color.primary.resolve(in: light))
        XCTAssertEqual(colors.foreground.resolve(in: dark), Color.primary.resolve(in: dark))
        XCTAssertNotEqual(colors.foreground.resolve(in: light), colors.foreground.resolve(in: dark))
    }

    func testAppSymbolsAllHaveNonEmptySystemNames() {
        XCTAssertFalse(AppSymbol.allCases.isEmpty)
        for symbol in AppSymbol.allCases {
            XCTAssertFalse(symbol.systemName.isEmpty, "Symbol \(symbol) systemName should not be empty")
            XCTAssertFalse(symbol.rawValue.isEmpty, "Symbol \(symbol) rawValue should not be empty")
        }
        XCTAssertEqual(AppSymbol.heartFill.systemName, "heart.fill")
        XCTAssertEqual(AppSymbol.tv.systemName, "tv")
        XCTAssertEqual(AppSymbol.book.systemName, "book")
        XCTAssertEqual(DesignSymbol.sparkles, AppSymbol.sparkles)
    }

    func testKeyPathSymbolInitializers() {
        let image = Image(\.crop)
        XCTAssertNotNil(image)
        let imageWithExplicitLabel = Image(systemName: \.cropSquare)
        XCTAssertNotNil(imageWithExplicitLabel)
        let label1 = Label("Test", \.sparkles)
        XCTAssertNotNil(label1)
        let label2 = Label(Text("Test"), \.sparkles)
        XCTAssertNotNil(label2)
        let label3 = Label(Text("Test"), systemImage: \.sparkles)
        XCTAssertNotNil(label3)
        let label4 = Label(Text("Test"), symbol: .sparkles)
        XCTAssertNotNil(label4)
        #if canImport(UIKit)
        let uiImage = UIImage(systemName: \.cropSquare)
        XCTAssertNotNil(uiImage)
        let uiImageDirect = UIImage(\.crop)
        XCTAssertNotNil(uiImageDirect)
        #endif
    }

    @MainActor
    func testKeyPathViewModifiersAndContainers() {
        let view = VStack(spacing: \.six) {
            HStack(spacing: \.ten) {
                Image(\.crop)
                    .font(\.caption2)
                    .padding(\.eight)
                    .padding(.horizontal, \.eight)
                    .opacity(\.p0_8)
                    .cornerRadius(\.twelve)
            }
        }
        XCTAssertNotNil(view)
    }

    func testAccentThemeAndColors() {
        XCTAssertEqual(AccentTheme.allCases.count, 4)
        XCTAssertEqual(AccentTheme.resolve(from: "ocean"), .ocean)
        XCTAssertEqual(AccentTheme.resolve(from: "invalid"), .default)
        XCTAssertEqual(AccentTheme.ocean.colorKeyPath, \.accentOcean)
        XCTAssertEqual(AccentTheme.mint.colorKeyPath, \.accentMint)
        XCTAssertEqual(AccentTheme.sunset.colorKeyPath, \.accentSunset)
        XCTAssertEqual(AccentTheme.default.colorKeyPath, \.accentColor)

        let colors = ColorTheme.default
        XCTAssertNotNil(colors.accentOcean)
        XCTAssertNotNil(colors.accentMint)
        XCTAssertNotNil(colors.accentSunset)
    }

    func testAppBrandPalettesAndRoles() {
        XCTAssertEqual(AppBrand.allCases.count, 3)
        for brand in AppBrand.allCases {
            let palette = brand.palette
            XCTAssertNotNil(palette.action)
            XCTAssertNotNil(palette.onAction)
            XCTAssertNotNil(palette.background)
            XCTAssertNotNil(palette.surface)
            XCTAssertNotNil(palette.border)
            XCTAssertNotNil(palette.text)
            XCTAssertNotNil(palette.mutedText)
            XCTAssertNotNil(palette.error)
            XCTAssertNotNil(palette.warning)
            XCTAssertNotNil(palette.success)
            XCTAssertNotNil(palette.authAction)
            XCTAssertNotNil(palette.authOnAction)
            XCTAssertNotNil(palette.authBackground)
            XCTAssertNotNil(palette.authForeground)
        }
        XCTAssertEqual(BrandPalette.palette(for: .showBook), BrandPalette.showBook)
        XCTAssertEqual(BrandPalette.palette(for: .myTV), BrandPalette.myTV)
        XCTAssertEqual(BrandPalette.palette(for: .motivationDaily), BrandPalette.motivationDaily)
    }

    func testPlaceholderColorTokens() {
        XCTAssertNotNil(PlaceholderColorToken.gradientStart)
        XCTAssertNotNil(PlaceholderColorToken.gradientEnd)
        #if canImport(UIKit)
        XCTAssertNotNil(PlaceholderColorToken.uiGradientStart)
        XCTAssertNotNil(PlaceholderColorToken.uiGradientEnd)
        #endif
    }

    func testColorThemeBrandKeyPaths() {
        for brand in AppBrand.allCases {
            let theme = ColorTheme(brand: brand)
            let palette = brand.palette
            XCTAssertEqual(theme[keyPath: \.action], palette.action)
            XCTAssertEqual(theme[keyPath: \.brandAction], palette.action)
            XCTAssertEqual(theme[keyPath: \.onAction], palette.onAction)
            XCTAssertEqual(theme[keyPath: \.brandOnAction], palette.onAction)
            XCTAssertEqual(theme[keyPath: \.background], palette.background)
            XCTAssertEqual(theme[keyPath: \.brandBackground], palette.background)
            XCTAssertEqual(theme[keyPath: \.surface], palette.surface)
            XCTAssertEqual(theme[keyPath: \.brandSurface], palette.surface)
            XCTAssertEqual(theme[keyPath: \.border], palette.border)
            XCTAssertEqual(theme[keyPath: \.brandBorder], palette.border)
            XCTAssertEqual(theme.primary, palette.text)
            XCTAssertEqual(theme.secondary, palette.mutedText)
            XCTAssertEqual(theme.accentColor, palette.action)
        }
        let rootTheme = DesignTokensTheme(brand: .myTV)
        XCTAssertEqual(rootTheme.colors.action, BrandPalette.myTV.action)
    }

    func testSemanticColorsKeyPathAndPaletteInitializers() {
        let keypathColors = SemanticColors(surface: \.surface, border: \.border)
        XCTAssertNotNil(keypathColors.surface)
        XCTAssertNotNil(keypathColors.border)

        let paletteColors = SemanticColors(palette: BrandPalette.myTV)
        XCTAssertEqual(paletteColors.action, BrandPalette.myTV.action)
        XCTAssertEqual(paletteColors.surface, BrandPalette.myTV.surface)
        XCTAssertEqual(paletteColors.border, BrandPalette.myTV.border)
    }

    func testAppBrandCurrentAndDynamicResolution() {
        XCTAssertNotNil(AppBrand.current)
        XCTAssertEqual(BrandPalette.current, BrandPalette.palette(for: AppBrand.current))
        let defaultTheme = ColorTheme.default
        XCTAssertEqual(defaultTheme.action, BrandPalette.current.action)
        XCTAssertEqual(defaultTheme.surface, BrandPalette.current.surface)
        XCTAssertEqual(defaultTheme.border, BrandPalette.current.border)
    }

    func testScaleTokensAndTheme() {
        XCTAssertEqual(ScaleToken.p0_8, 0.8)
        XCTAssertEqual(ScaleToken.p0_9, 0.9)
        XCTAssertEqual(ScaleToken.p0_95, 0.95)
        XCTAssertEqual(ScaleToken.p1_0, 1.0)
        XCTAssertEqual(ScaleToken.p1_05, 1.05)
        XCTAssertEqual(ScaleToken.p1_1, 1.1)
        XCTAssertEqual(ScaleToken.p1_15, 1.15)
        XCTAssertEqual(ScaleToken.p1_2, 1.2)

        let theme = ScaleTheme.default
        XCTAssertEqual(theme[keyPath: \.p0_8], 0.8)
        XCTAssertEqual(theme[keyPath: \.p0_9], 0.9)
        XCTAssertEqual(theme[keyPath: \.p0_95], 0.95)
        XCTAssertEqual(theme[keyPath: \.p1_0], 1.0)
        XCTAssertEqual(theme[keyPath: \.p1_05], 1.05)
        XCTAssertEqual(theme[keyPath: \.p1_1], 1.1)
        XCTAssertEqual(theme[keyPath: \.p1_15], 1.15)
        XCTAssertEqual(theme[keyPath: \.p1_2], 1.2)

        let customTheme = ScaleTheme(p0_8: 0.75, p1_0: 1.0)
        XCTAssertEqual(customTheme.p0_8, 0.75)
        XCTAssertEqual(customTheme.p1_0, 1.0)

        let rootTheme = DesignTokensTheme()
        XCTAssertEqual(rootTheme.scale, ScaleTheme.default)
    }

    @MainActor
    func testScaleEffectKeyPathModifiers() {
        func scaleKeyPath(favorite: Bool) -> KeyPath<ScaleTheme, CGFloat> {
            favorite ? \.p1_15 : \.p1_0
        }
        let view = Text("Scale")
            .scaleEffect(\.p1_15)
            .scaleEffect(\.p1_0, anchor: .topLeading)
            .scaleEffect(scaleKeyPath(favorite: true))
            .scaleEffect(scaleKeyPath(favorite: false))
            .scaleEffect(x: \.p1_15, y: \.p0_95, anchor: .center)
            .scaleEffect(x: \.p1_0, y: nil)
            .scaleEffect(x: nil, y: \.p1_15)
            .environment(\.designTokens, DesignTokensTheme.default)
        XCTAssertNotNil(view)
    }

    @MainActor
    func testTintAndToggleStyleKeyPathModifiers() {
        let view = Text("Tint")
            .tint(\.action)
            .tint(\.brandPrimary)
            .tint(\.green, opacity: \.p0_8)
            .environment(\.designTokens, DesignTokensTheme.default)
        XCTAssertNotNil(view)

        let toggleStyle1 = SwitchToggleStyle(tint: \.green)
        XCTAssertNotNil(toggleStyle1)
        let toggleStyle2 = SwitchToggleStyle(tint: \.brandPrimary, opacity: \.p0_8)
        XCTAssertNotNil(toggleStyle2)

        let colors = ColorTheme.default
        XCTAssertEqual(colors.brandPrimary, colors.primary)
        XCTAssertEqual(colors.brandSecondary, colors.secondary)
    }

    @MainActor
    func testOpacityKeyPathModifiersAndColorExtensions() {
        func opacityKeyPath(muted: Bool) -> KeyPath<OpacityTheme, Double> {
            muted ? \.p0_3 : \.p1_0
        }
        let view = Text("Opacity")
            .opacity(\.p0_8)
            .opacity(opacityKeyPath(muted: true))
            .opacity(opacityKeyPath(muted: false))
            .environment(\.designTokens, DesignTokensTheme.default)
        XCTAssertNotNil(view)

        let semiTransparentRed = Color.red.opacity(\.p0_5)
        XCTAssertNotNil(semiTransparentRed)
    }

    @MainActor
    func testForegroundStyleKeyPathModifiers() {
        let view = Text("ForegroundStyle")
            .foregroundStyle(\.brandPrimary)
            .foregroundStyle(\.action, opacity: \.p0_9)
            .environment(\.designTokens, DesignTokensTheme.default)
        XCTAssertNotNil(view)
    }

    @MainActor
    func testFrameKeyPathModifiers() {
        let view = Text("Frame")
            .frame(size: \.s24)
            .frame(size: \.twentyFour)
            .frame(width: \.twentyFour, height: \.sixteen)
            .frame(minWidth: \.four, idealWidth: \.twentyFour, maxWidth: \.thirtyTwo, minHeight: \.four, idealHeight: \.twentyFour, maxHeight: \.thirtyTwo)
            .frame(width: \.s24, height: \.s16)
            .frame(minWidth: \.s4, idealWidth: \.s24, maxWidth: \.s40, minHeight: \.s4, idealHeight: \.s24, maxHeight: \.s40)
        XCTAssertNotNil(view)
    }

    @MainActor
    func testOverlayStrokeModifiers() {
        let view = Text("Stroke")
            .overlayRoundedStroke(cornerRadius: \.twelve, color: \.border, lineWidth: \.one, opacity: \.p0_8)
            .overlayRoundedStroke(cornerRadius: \.r12, color: \.border, lineWidth: \.two)
            .overlayRoundedStroke(cornerRadius: \.p12, color: \.action, lineWidth: \.one)
            .overlayCapsuleStroke(color: \.action, lineWidth: \.one, opacity: \.p0_9)
            .environment(\.designTokens, DesignTokensTheme.default)
        XCTAssertNotNil(view)
    }

    @MainActor
    func testLayoutContainersWithDesignMetricSpacing() {
        let vstack = VStack(spacing: \.s8) { Text("1") }
        XCTAssertNotNil(vstack)

        let hstack = HStack(spacing: \.s8) { Text("1") }
        XCTAssertNotNil(hstack)

        let lazyVStack = LazyVStack(spacing: \.s12) { Text("1") }
        XCTAssertNotNil(lazyVStack)

        let lazyHStack = LazyHStack(spacing: \.s12) { Text("1") }
        XCTAssertNotNil(lazyHStack)

        let gridItem = GridItem(.flexible(), spacing: \.s12)
        XCTAssertNotNil(gridItem)

        let lazyVGrid = LazyVGrid(columns: [gridItem], spacing: \.s12) { Text("1") }
        XCTAssertNotNil(lazyVGrid)

        let lazyHGrid = LazyHGrid(rows: [gridItem], spacing: \.s12) { Text("1") }
        XCTAssertNotNil(lazyHGrid)
    }

    func testSemanticLayoutPresetsAndDeprecations() {
        let compact = LayoutPreset.compact
        XCTAssertEqual(compact.screenInset, 16)
        XCTAssertEqual(compact.sectionSpacing, 24)
        XCTAssertEqual(compact.cardRadius, 12)
        XCTAssertEqual(compact.minimumControlHeight, 48)

        let regular = LayoutPreset.regular
        XCTAssertEqual(regular.screenInset, 20)
        XCTAssertEqual(regular.sectionSpacing, 28)
        XCTAssertEqual(regular.cardRadius, 12)
        XCTAssertEqual(regular.minimumControlHeight, 48)

        let spacious = LayoutPreset.spacious
        XCTAssertEqual(spacious.screenInset, 24)
        XCTAssertEqual(spacious.sectionSpacing, 32)
        XCTAssertEqual(spacious.cardRadius, 20)
        XCTAssertEqual(spacious.minimumControlHeight, 52)

        let card = compact.card
        XCTAssertEqual(card.cornerRadius, 12)
        let button = compact.button
        XCTAssertEqual(button.minimumHeight, 48)
    }

    @available(*, deprecated, message: "Testing deprecated API")
    func testDeprecatedAppNamedLayoutPresets() {
        XCTAssertEqual(LayoutPreset.compactMedia.screenInset, LayoutPreset.compact.screenInset)
        XCTAssertEqual(LayoutPreset.editorial.screenInset, LayoutPreset.regular.screenInset)
        XCTAssertEqual(LayoutPreset.softWellness.screenInset, LayoutPreset.spacious.screenInset)
    }

    func testIconAndAvatarPresets() {
        XCTAssertEqual(IconPreset.small, CGSize(width: 18, height: 18))
        XCTAssertEqual(IconPreset.medium, CGSize(width: 28, height: 28))
        XCTAssertEqual(IconPreset.large, CGSize(width: 36, height: 36))

        XCTAssertEqual(IconMetrics.small.size, IconPreset.small)
        XCTAssertEqual(IconMetrics.medium.size, IconPreset.medium)
        XCTAssertEqual(IconMetrics.large.size, IconPreset.large)

        XCTAssertEqual(AvatarPreset.small, CGSize(width: 28, height: 28))
        XCTAssertEqual(AvatarPreset.medium, CGSize(width: 40, height: 40))
        XCTAssertEqual(AvatarPreset.large, CGSize(width: 56, height: 56))

        XCTAssertEqual(AvatarMetrics.small.size, AvatarPreset.small)
        XCTAssertEqual(AvatarMetrics.small.cornerRadius, 14)
        XCTAssertEqual(AvatarMetrics.medium.size, AvatarPreset.medium)
        XCTAssertEqual(AvatarMetrics.medium.cornerRadius, 20)
        XCTAssertEqual(AvatarMetrics.large.size, AvatarPreset.large)
        XCTAssertEqual(AvatarMetrics.large.cornerRadius, 28)
    }

    func testTouchTargetAndThumbnailPresets() {
        XCTAssertEqual(TouchTargetPreset.minimum, 44)
        XCTAssertEqual(TouchTargetPreset.standard, 48)
        XCTAssertEqual(TouchTargetPreset.spacious, 52)

        XCTAssertEqual(TouchTarget.min, 44)
        XCTAssertEqual(TouchTarget.standard, 48)
        XCTAssertEqual(TouchTarget.spacious, 52)

        XCTAssertEqual(ThumbnailPreset.small, CGSize(width: 60, height: 90))
        XCTAssertEqual(ThumbnailPreset.medium, CGSize(width: 90, height: 135))
        XCTAssertEqual(ThumbnailPreset.large, CGSize(width: 120, height: 180))
        XCTAssertEqual(ThumbnailPreset.channelLogo, CGSize(width: 96, height: 60))
        XCTAssertEqual(ThumbnailPreset.card, CGSize(width: 120, height: 170))

        XCTAssertEqual(ThumbnailMetrics.small.size, ThumbnailPreset.small)
        XCTAssertEqual(ThumbnailMetrics.small.cornerRadius, 6)
        XCTAssertEqual(ThumbnailMetrics.channelLogo.size, ThumbnailPreset.channelLogo)
        XCTAssertEqual(ThumbnailMetrics.card.size, ThumbnailPreset.card)
    }

    @MainActor
    func testDesignMetricThemeSemanticPresetsAndKeyPaths() {
        let metrics = DesignMetricTheme.default
        XCTAssertEqual(metrics[keyPath: \.iconSmall], 18)
        XCTAssertEqual(metrics[keyPath: \.iconMedium], 28)
        XCTAssertEqual(metrics[keyPath: \.iconLarge], 36)
        XCTAssertEqual(metrics[keyPath: \.avatarSmall], 28)
        XCTAssertEqual(metrics[keyPath: \.avatarMedium], 40)
        XCTAssertEqual(metrics[keyPath: \.avatarLarge], 56)
        XCTAssertEqual(metrics[keyPath: \.touchTargetMin], 44)
        XCTAssertEqual(metrics[keyPath: \.touchTargetStandard], 48)
        XCTAssertEqual(metrics[keyPath: \.touchTargetSpacious], 52)
        XCTAssertEqual(metrics[keyPath: \.channelLogoWidth], 96)
        XCTAssertEqual(metrics[keyPath: \.channelLogoHeight], 60)
        XCTAssertEqual(metrics[keyPath: \.thumbnailSmallWidth], 60)
        XCTAssertEqual(metrics[keyPath: \.thumbnailSmallHeight], 100)

        XCTAssertEqual(metrics[keyPath: \.s28], 28)
        XCTAssertEqual(metrics[keyPath: \.s44], 44)
        XCTAssertEqual(metrics[keyPath: \.s48], 48)
        XCTAssertEqual(metrics[keyPath: \.s52], 52)
        XCTAssertEqual(metrics[keyPath: \.s56], 56)
        XCTAssertEqual(metrics[keyPath: \.s96], 96)

        let view = Text("Presets")
            .frame(width: \.iconMedium, height: \.iconMedium)
            .frame(size: \.s28)
            .frame(width: \.channelLogoWidth, height: \.channelLogoHeight)
            .frame(minWidth: \.touchTargetMin, minHeight: \.touchTargetMin)
            .environment(\.designTokens, DesignTokensTheme.default)
        XCTAssertNotNil(view)
    }
}
