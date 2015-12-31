import PackageDescription

let package = Package(
  targets: [
    Target(name: "cat", dependencies: [.Target(name: "libutil")]),
  ],
  dependencies: [
    .Package(url: "https://github.com/kylef/Commander.git", majorVersion: 0, minor: 3),
    .Package(url: "https://github.com/kylef/PathKit.git", majorVersion: 0, minor: 6),
  ]
)
