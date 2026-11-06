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
}
