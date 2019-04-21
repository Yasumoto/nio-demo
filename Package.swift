// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "nio-demo",
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio", from: "2.0.0"),
        .package(url: "https://github.com/apple/swift-nio-ssl", from: "2.0.0"),
    ],
    targets: [
        .target(
            name: "nio-demo",
            dependencies: ["NIO", "NIOHTTP1", "NIOSSL"]),
        .testTarget(
            name: "nio-demoTests",
            dependencies: ["nio-demo"]),
    ]
)
