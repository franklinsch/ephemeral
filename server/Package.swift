import PackageDescription

let package = Package(
    name: "Ephemeral",
    dependencies: [
        .Package(
          url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git",
          majorVersion: 2, minor: 0
        ),
        .Package(
          url:"https://github.com/PerfectlySoft/Perfect-WebSockets.git",
          majorVersion: 2, minor: 0
        ),
    ]
)
