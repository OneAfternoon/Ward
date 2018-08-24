// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Ward",
    products: [
        .library(name: "Ward", targets: ["Ward"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Ward", dependencies: []),
        .testTarget(name: "WardTests", dependencies: ["Ward"]),
    ]
)
