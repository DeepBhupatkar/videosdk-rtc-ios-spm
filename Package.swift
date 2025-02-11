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
            targets: ["VideoSDKRTCSwift", "VideoSDKRTC", "WebRTC", "Mediasoup"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/socketio/socket.io-client-swift.git", from: "16.0.0") 
    ],
    targets: [
        .target(
            name: "VideoSDKRTCSwift",
            dependencies: ["SocketIO"] 
        ),
        .binaryTarget(name: "WebRTC", path: "Sources/WebRTC.xcframework"),
        .binaryTarget(name: "Mediasoup", path: "Sources/Mediasoup.xcframework"),
        .binaryTarget(name: "VideoSDKRTC", path: "Sources/VideoSDKRTC.xcframework"),
        .testTarget(
            name: "VideoSDKRTCSwiftTests",
            dependencies: ["VideoSDKRTCSwift"]
        ),
    ]
)
