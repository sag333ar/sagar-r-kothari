Put following code-snippet for formatting a JSON string to pretty print JSON.

```Objective-C
+ (NSString*) formatJSONPretty:(NSData *)data {
    id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    if (obj) {
        NSData* d = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:nil];
        return [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
    } else {
        return nil;
    }
}
```