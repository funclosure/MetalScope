// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MetalScope",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "MetalScope",
            targets: ["MetalScope"]),
    ],
    targets: [
        .target(
            name: "MetalScope",
            path: "Sources")
    ]
)
