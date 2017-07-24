Program given below does following functions.

* Connects to database
* Create model object
* Creates table to specified database of PostgresQL
* Creates & saves a record to table/database
* Gets all record from the table
* Converts objects to JSON
* Retuns HTTPResponse with JSON data
* Handles exceptions if any

Look for code comments inside code-snippet given below for better understanding.

### Contents of `main.swift` file.

```swift
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

import StORM
import PostgresStORM

// Connects to database
PostgresConnector.host = "localhost"
PostgresConnector.username = "perfect"
PostgresConnector.password = "swiftperfect"
PostgresConnector.database = "perfect_testing"
PostgresConnector.port = 5432

// Creates table to specified database of PostgresQL
let setupObj = Acronym()
try? setupObj.setup()

var routes = Routes()

func test(httpRequest: HTTPRequest, httpResponse: HTTPResponse) {
  do {
    // create & save acronym
    let acronym = Acronym()
    acronym.short = "AFK"
    acronym.long = "Away From Keyboard"
    try acronym.save(set: { (id: Any) in
      acronym.id = id as! Int
    })
    
    // get all acronyms
    let getObj = Acronym()
    try getObj.findAll()
    var acronyms: [[String: Any]] = []
    for row in getObj.rows() {
      acronyms.append(row.asDictionary())
    }
    // Retuns HTTPResponse with JSON data
    try httpResponse.setBody(json: acronyms)
    .setHeader(.contentType, value: "application/json")
    .completed()
  } catch {
  	// Handles exceptions if any
    httpResponse.setBody(string: "Error handling request \(error)")
    .completed(status: .internalServerError)
  }
}

routes.add(method: .get, uri: "/test", handler: test)

let server = HTTPServer()
server.serverPort = 8080
server.documentRoot = "webroot"
server.addRoutes(routes)

do {
  try server.start()
} catch PerfectError.networkError (let err, let msg){
  print("Network error thrown: \(err) \(msg)")
}
```

### Contents of `Acronym.swift`

```swift
import StORM
import PostgresStORM

Create model object
class Acronym: PostgresStORM {

  var id: Int = 0
  var short: String = ""
  var long: String = ""

  override func table() -> String {
    return "acronym"
  }

  override func to(_ this: StORMRow) {
    id = this.data["id"] as? Int ?? 0
    short = this.data["short"] as? String ?? ""
    long = this.data["long"] as? String ?? ""
  }

  func rows() -> [Acronym] {
    var rows: [Acronym] = []
    for i in 0..<self.results.rows.count {
      let row = Acronym()
      row.to(self.results.rows[i])
      rows.append(row)
    }
    return rows
  }

  func asDictionary() -> [String: Any] {
    return [
      "id": self.id,
      "short": self.short,
      "long": self.long
    ]
  }

}
```