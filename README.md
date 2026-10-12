# DesignTokensKit

Small, configurable SwiftUI primitives. The library keeps each app's appearance policy and semantic colors with that app.

```swift
.package(url: "https://github.com/Anurag-Chourasia/DesignTokensKit.git", exact: "1.1.0")
// Target dependency: .product(name: "DesignTokensKit", package: "DesignTokensKit")
```

## API

- `Spacing.eight/twelve/sixteen/twenty`: exact point values observed in both consumers. Do not replace implicit system padding or round bespoke values.
- `SemanticColors`: surface, foreground, border, action and onAction Color values. Neutral defaults preserve SwiftUI primary/accent resolution; configure action contrast in the app. No universal success/error palette.
- `SurfaceMetrics`: padding, corner radius and border width for a particular surface.
- `ButtonMetrics`: padding, radius and minimum (not fixed) dimensions, defaulting to a 44-point minimum touch target.

```swift
import SwiftUI
import DesignTokensKit
let metrics = SurfaceMetrics(cornerRadius: 26.5, borderWidth: 1)
let colors = SemanticColors(surface: .white, action: .blue, onAction: .white)
```

For adaptive UIKit surfaces, pass `Color(uiColor: .secondarySystemGroupedBackground)` on iOS. Colors are stored intact, never sampled into RGB. No global theme or environment injection is required. The app owns typography, dimensions, navigation, resources and appearance selection.

## Compatibility and validation

Declared iOS 16.6 and macOS 14 floors. Validation baseline: Xcode 27.0 (27A266a), Apple Swift 6.4. The tools 6.0 manifest is not a claim of testing on older compilers. Tests cover scalar values, custom geometry, value-local overrides and primary color resolution in light/dark environments. Host tests and generic iOS Simulator builds do not prove minimum-OS runtime or VoiceOver behavior.

Run `swift test -Xswiftc -strict-concurrency=complete -Xswiftc -warnings-as-errors` with the selected Xcode SDK. CI additionally validates the manifest and iOS Simulator product. No external dependencies.

## Contribution contract

Owner: Anurag Chourasia. A shared API needs a concrete consumer, public documentation, meaningful tests and explicit compatibility intent. Preserve exact geometry and adaptive colors. Breaking semantics require a major version; published tags must not move.

MIT — Copyright (c) 2026 Anurag Chourasia.

## Additional primitives (1.1.0)

Spacing adds 4, 5, 10, 14, 30 and 32 points from existing app layouts. `CornerRadius` supplies 4, 6, 10, 12, 14, 15, 20 and 30 points; bespoke values such as ShowBook's 26.5 remain caller-owned. `StrokeWidth.one/two` are point values, not pixel hairlines. `TouchTarget.minimum` is 44 points; artwork dimensions do not define hit areas.

`IconMetrics` separates artwork size from optional padding. Nil preserves SwiftUI system padding, zero explicitly removes it. `MessageTypography` supplies overridable semantic fonts (largeTitle/headline/caption) without freezing Dynamic Type to point sizes. Store app brand palettes in app-owned `SemanticColors` values; the package does not define either app's colors.
