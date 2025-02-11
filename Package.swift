// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "VideoSDKRTCSwift",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "VideoSDKRTCSwift",
            targets: ["VideoSDKRTCSwift"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/socketio/socket.io-client-swift.git", from: "16.0.0")
    ],
    targets: [
        // Main target depending on VideoSDKRTC, WebRTC, Mediasoup, and SocketIO
        .target(
            name: "VideoSDKRTCSwift",
            dependencies: [
                "VideoSDKRTC",
                "WebRTC",
                "Mediasoup",
                .product(name: "SocketIO", package: "socket.io-client-swift")
            ]
        ),
        // Binary frameworks
        .binaryTarget(
            name: "VideoSDKRTC",
            path: "Sources/VideoSDKRTC.xcframework"
        ),
        .binaryTarget(
            name: "WebRTC",
            path: "Sources/WebRTC.xcframework"
        ),
        .binaryTarget(
            name: "Mediasoup",
            path: "Sources/Mediasoup.xcframework"
        ),
        // Unit tests
        .testTarget(
            name: "VideoSDKRTCSwiftTests",
            dependencies: ["VideoSDKRTCSwift"]
        ),
    ]
)
