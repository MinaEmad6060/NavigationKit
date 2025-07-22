// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "NavigationKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "NavigationKit",
            targets: ["NavigationKit"]
        ),
    ],
    targets: [
        .target(
            name: "NavigationKit",
            path: "Sources/NavigationKit",
            exclude: [],
            sources: ["."],
            publicHeadersPath: nil
        )
    ]
) 
