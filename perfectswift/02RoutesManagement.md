Read inline comments to understand.

```swift
// 1. Import Perfect library, http & http-server.
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

// 2. Create HTTP server
let server = HTTPServer()

// 3. Set the server port & root directory.
server.serverPort = 8080
server.documentRoot = "webroot"

// 4. Create routes which will allow to handler different routes
var routes = Routes()

// 5. Add first route, which will handle `localhost:8080/` get request.
routes.add(method: .get, uri: "/") { (request: HTTPRequest, response: HTTPResponse) in
  response.setBody(string: "<h1>Hello, world!</h1>")
    .completed()
}

// 6. A common function to handle json response.
func returnJSONResponse(_ message: String, response: HTTPResponse) {
  do {
    try response.setBody(json: ["message": message])
      .setHeader(.contentType, value: "application/json")
      .completed()
  } catch {
    response.setBody(string: "Error handling request \(error)")
      .completed(status: .internalServerError)
  }
}

// 7. A route, which will handle `localhost:8080/hello` get request 
// & return json as `{ 'message': 'Hello, JSON' }
routes.add(method: .get, uri: "/hello") { (request: HTTPRequest, response: HTTPResponse) in
  returnJSONResponse("Hello, JSON!", response: response)
}

// 8. A route, which will handle `localhost:8080/hello/there` get request 
// & return json as `{ 'message': 'I am tired of saying hello!' }
routes.add(method: .get, uri: "/hello/there") { (request: HTTPRequest, response: HTTPResponse) in
  returnJSONResponse("I am tired of saying hello!", response: response)
}

// 9. A route, which will handle `localhost:8080/beers/20` get request 
// & return json as `{ 'message': 'Take one down, pass it around, 19 bottles of beer on the wall' }
routes.add(method: .get, uri: "/beers/{num_beers}") { (request: HTTPRequest, response: HTTPResponse) in
  guard let numBeersString = request.urlVariables["num_beers"],
    let numBeersInt = Int(numBeersString) else {
    response.completed(status: .badRequest)
    return
  }
  returnJSONResponse("Take one down, pass it around, \(numBeersInt-1) bottles of beer on the wall",
    response: response)
}

routes.add(method: .post, uri: "/post") { (request: HTTPRequest, response: HTTPResponse) in
  guard let name = request.param(name: "name") else {
      response.completed(status: .badRequest)
      return
  }
  returnJSONResponse("Hello, \(name)", response: response)
}

server.addRoutes(routes)

do {
  try server.start()
} catch PerfectError.networkError (let err, let msg){
  print("Network error thrown: \(err) \(msg)")
}
```