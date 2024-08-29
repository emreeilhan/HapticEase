// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "HapticEase",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "HapticEase",
            targets: ["HapticEase"]),
    ],
    targets: [
        .target(
            name: "HapticEase")
    ]
)
