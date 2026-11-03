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
}
