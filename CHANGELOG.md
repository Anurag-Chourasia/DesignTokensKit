# Changelog

## 1.23.0

- Add `.tint`, `.opacity`, `.scaleEffect`, `.frame`, `.lineSpacing`, `.shadow`, `.overlayRoundedStroke`, and `.overlayCapsuleStroke` KeyPath View modifiers.
- Add stack spacing KeyPath overloads for `VStack`, `HStack`, `LazyVStack`, `LazyHStack`, `LazyVGrid`, `LazyHGrid`, and `GridItem` supporting both `SpacingTheme` and `DesignMetricTheme`.
- Generalize `LayoutPreset` with semantic presets (`compact`, `regular`, `spacious`) and deprecate app-named cases (`compactMedia`, `editorial`, `softWellness`).
- Add semantic component presets: `IconPreset`, `IconMetrics.small/.medium/.large`, `AvatarPreset`, `AvatarMetrics`, `TouchTargetPreset`, `ThumbnailPreset`, `ThumbnailMetrics`.
- Add ergonomic KeyPath token properties (`s0` through `s160`, `r4` through `r30`, `cardRadius`, `medium`, `large`, `small`, etc.).
- Add the 5 custom SwiftLint architecture governance rules from the Ecosystem Specification.
- Achieve 98.0% line coverage and 0 lint violations across all package sources.

## 1.2.0

- Add shared catalog tile geometry, cover metrics, typography, dynamic/system colors, palette values, point primitives, opacity and scale tokens.
- Represent environment-dependent SwiftUI padding explicitly with Spacing.system.
- Retain all existing APIs and geometry defaults.

## 1.1.0

- Add source-backed spacing, corner and stroke primitives, minimum touch target, configurable icon metrics and semantic message typography.
- Preserve all 1.0.0 defaults and public APIs.

## 1.0.0 — initial candidate

- Add exact shared spacing primitives and configurable surface/button metrics.
- Keep semantic SwiftUI colors app-configurable and dynamically resolved.
- Add deterministic geometry/theme tests and strict host/iOS CI.

Publication status is recorded by the GitHub Release after the intended commit passes CI.
