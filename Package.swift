import PackageDescription

let package = Package(
	name: "Render",
	dependencies: [
      .Package(url: "https://github.com/slimane-swift/Renderable.git", majorVersion: 0, minor: 3),
      .Package(url: "https://github.com/slimane-swift/AsyncResponderConvertible.git", majorVersion: 0, minor: 3),
  ]
)
