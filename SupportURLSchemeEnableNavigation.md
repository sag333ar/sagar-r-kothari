## Step 1. Edit Info.plist

Put following entry in your `Info.plist` file of your project.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<array>
	<dict>
		<key>CFBundleURLName</key>
		<string>com.yourApp.bundleID</string>
		<key>CFBundleURLSchemes</key>
		<array>
			<string>NameOfURLScheme</string>
		</array>
	</dict>
</array>
</plist>
```

h2. Step 2. Edit `AppDelegate.m`

Under your `AppDelegate.m` or put following lines of code.

```objective-c
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
	NSLog(@"URL is %@",url.description); 
}
```

```swift
func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
	print("URL is \(url.description)")
	return true
}
```

## Example

URLs to redirect for above example

```
NameOfURLScheme://login_result/failed
NameOfURLScheme://login_result/authenticated?token=sometoken
NameOfURLScheme://redeem_coupon/furniture/double-bed?coupon=somecoupon_code
```