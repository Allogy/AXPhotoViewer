// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AXPhotoViewer",
	platforms:  [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AXPhotoViewer",
            targets: ["AXPhotoViewer"],
        ),
    ],
	dependencies: [
		.package(
			url: "https://github.com/Flipboard/FLAnimatedImage.git",
			.upToNextMinor(from: "1.0.17")
		),
		.package(
			url: "https://github.com/Allogy/AXStateButton.git",
			.upToNextMinor(from: "1.2.1")
		),
	],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AXPhotoViewer",
			dependencies: [
				"FLAnimatedImage",
				"AXStateButton"
			],
			resources: [.process("Resources")]
        ),
        .testTarget(
            name: "AXPhotoViewerTests",
            dependencies: ["AXPhotoViewer"]
        ),
    ],
	swiftLanguageModes: [.v5]
)
