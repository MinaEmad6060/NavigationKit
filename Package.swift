// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "NavigationKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "NavigationKit",
            targets: ["NavigationLayer"]
        ),
    ],
    targets: [
        .target(
            name: "NavigationLayer",
            path: "Sources/NavigationLayer",
            exclude: [],
            sources: ["."],
            publicHeadersPath: nil
        )
    ]
) 