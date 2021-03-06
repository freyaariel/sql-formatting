// swift-tools-version:5.5
import PackageDescription

let package = Package(
  name: "sql-formatting",
  platforms: [
    .macOS(.v10_10),
    .iOS(.v9),
    .tvOS(.v9),
    .watchOS(.v7),
  ],
  products: [
    .library(name: "SQLFormatting", targets: ["SQLFormatting"]),
  ],
  dependencies: [
    .package(name: "perl-core", url: "https://github.com/freyaariel/perl-core.git", from: "0.1.0"),
  ],
  targets: [
    .target(
      name: "SQLFormatting",
      dependencies: [.product(name: "PerlCore", package: "perl-core")],
      exclude: ["node_modules", "package.json", "yarn.lock", "PGFormatter.pm"],
      resources: [.copy("PGMinify.js"), .copy("SQLFormatter.js")]
    ),
    .testTarget(
      name: "SQLFormattingTests",
      dependencies: ["SQLFormatting"]
    ),
  ]
)
