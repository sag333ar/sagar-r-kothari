Step 1. Create a folder for your project & move to that location.

```
mkdir hello-perfect
cd hello-perfect
```

Step 2. Create swift-package of your project

```
swift package init  --type executable
```

Step 3. Using swift-package, generate xcode project.

```
swift package generate-xcodeproj
```

Step 4. Open project.

```
open ./hello-perfect.xcodeproj
```

Step 5. Switch to second target from tool bar, build & run, to make sure everything is fine.

Step 6. Open `package.swift` file & add dependency for perfect-swift

```swift
import PackageDescription
let package = Package(
	name: "hello-perfect",
	dependencies: [
		.Package(
		url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git",
		majorVersion: 2
		)
	]
)
```

Step 7. Switch back to terminal & update following commands.

```
swift package update
swift package generate-xcodeproj
```

Step 8. Open `main.swift` & import libraries as follows & build to ensure everything works fine.

```
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
```

Step 9. Create webroot folder under same directory. Create an `index.html` file under it with sample html & update project using following command.

```
swift package generate-xcodeproj
```

Step 10. Create http server.

```swift
let server = HTTPServer()
server.serverPort = 8080
server.documentRoot = "webroot"

do {
	try server.start()
} catch PerfectError.networkError (let err, let msg){
	print("Network error thrown: \(err) \(msg)")
}
```

Step 11. Update configuration.
Switch to second target from tool bar & Edit the scheme.
For run configuration, set working directory to root directory of the project.

Build & run. Server will be started on port 8080.