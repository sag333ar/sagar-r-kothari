Insert following piece of code to create a basic http server with node.js

```js
// File name = server.js
var http = require("http");

var server =http.createServer(function(request, response) {
   response.writeHead(200, {"Content-Type": "text/html"});
   response.write("<h1>Hello World</h1>");
   response.end();
});
server.listen(8080);
```

To start server, run following command.

```sh
node server.js
```
