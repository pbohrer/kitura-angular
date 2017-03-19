import PackageDescription

let package = Package(
    name: "kitura-angular",

	dependencies: [
		.Package(url: "https://github.com/IBM-Swift/HeliumLogger.git", majorVersion: 1, minor: 6),
		.Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 1, minor: 6)
	]
)
