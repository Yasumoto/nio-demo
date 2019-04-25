// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "nio-demo",
    products: [
        .executable(
            name: "echo-server",
            targets: ["EchoServer"]),
        .executable(
            name: "http-client",
            targets: ["HTTPClient"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-nio-ssl", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "EchoServer",
            dependencies: ["NIO", "NIOHTTP1", "NIOOpenSSL"]),
        .target(
            name: "HTTPClient",
            dependencies: ["NIO", "NIOHTTP1", "NIOOpenSSL"])
    ]
)
