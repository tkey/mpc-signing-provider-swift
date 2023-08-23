// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Web3SwiftMpcProvider",
    platforms: [.iOS(.v14), .macOS(.v10_15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Web3SwiftMpcProvider",
            targets: ["Web3SwiftMpcProvider"]),
    ],
    dependencies: [
        .package(url: "https://github.com/argentlabs/web3.swift", from:"1.6.0"),
        .package(url: "https://github.com/torusresearch/tss-client-swift.git", from: "1.0.10"),
        .package(url: "https://github.com/tkey/tkey-mpc-swift.git", branch: "alpha"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Web3SwiftMpcProvider",
            dependencies: ["web3.swift", "tss-client-swift", .product(name: "ThresholdKey", package: "tkey-mpc-swift")],
            path: "Sources/Web3SwiftMpcProvider"),
        
        .testTarget(
            name: "Web3SwiftMpcProviderTests",
            dependencies: ["Web3SwiftMpcProvider"]),
    ],
    swiftLanguageVersions: [.v5]
)
