// swift-tools-version:5.5

import PackageDescription

let pkg = Package(name: "PromiseKit")
pkg.platforms = [
    .iOS(.v12),
    .watchOS(.v8)
]
pkg.swiftLanguageVersions = [.v5]

pkg.targets = [
    .target(name: "PromiseKit", dependencies: [])
]

pkg.products = [
    .library(name: "PromiseKit", targets: ["PromiseKit"]),
    .library(name: "PromiseKitDynamic", type: .dynamic, targets: ["PromiseKit"])
]
