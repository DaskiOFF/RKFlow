// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "RKFlow",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "RKFlow",
            targets: ["RKFlow"]),
    ],
    targets: [
        .target(
            name: "RKFlow",
            dependencies: []),
    ]
)
