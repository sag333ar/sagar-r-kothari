## Convert data to base64 encoded string

```Objective-C
// Step 1. Create NSData object
NSData *data = [@"Some text for Data - sagarrkothari.com" dataUsingEncoding:NSUTF8StringEncoding];
 
// Step 2. Get NSString from NSData object in Base64
NSString *base64Encoded = [data base64EncodedStringWithOptions:0];
 
// Step 3. Print the Base64 encoded string
NSLog(@"Encoded: %@", base64Encoded);
```

## Convert base64 encoding string to data 

```Objective-C
// Step 1. NSData from the Base64 encoded str
NSData *data = [[NSData alloc]
  initWithBase64EncodedString:base64String options:0];
 
// Step 2. Decoded NSString from the NSData
NSString *decodedString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
NSLog(@"Decoded: %@", base64Decoded);
```