// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "TreeSitterC",
    products: [
        .library(name: "TreeSitterC", targets: ["TreeSitterC"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tree-sitter/swift-tree-sitter", branch: "main")
    ],
    targets: [
        .target(
            name: "TreeSitterC",
            dependencies: [],
            path: ".",
            sources: [
                "src/parser.c",
            ],
            resources: [
                .copy("queries")
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("src")]
        ),
        .testTarget(
            name: "TreeSitterCTests",
            dependencies: [
                .product(name: "SwiftTreeSitter", package: "swift-tree-sitter"),
                "TreeSitterC",
            ],
            path: "bindings/swift/TreeSitterCTests"
        )
    ],
    cLanguageStandard: .c11
)
