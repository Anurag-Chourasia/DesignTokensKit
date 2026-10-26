// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "DesignTokensKit",
    platforms: [.iOS(.v16), .macOS(.v14)],
    products: [.library(name: "DesignTokensKit", targets: ["DesignTokensKit"])],
    targets: [
        .target(name: "DesignTokensKit"),
        .testTarget(name: "DesignTokensKitTests", dependencies: ["DesignTokensKit"])
    ]
)
