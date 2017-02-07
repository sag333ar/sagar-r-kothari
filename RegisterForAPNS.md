Following function will help you to registering for Push notification on an iOS Application.

```swift
func registerForNotification(_ application: UIApplication) {
	if #available(iOS 10.0, *) {
		let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
		UNUserNotificationCenter.current().requestAuthorization(
			options: authOptions,
			completionHandler: { _, _ in }
		)
		// For iOS 10 display notification (sent via APNS)
		UNUserNotificationCenter.current().delegate = self
	} else {
		let setting = UIUserNotificationSettings(
			types: [.alert, .badge, .sound], 
			categories: nil
		)
		application.registerUserNotificationSettings(setting)
	}
	application.registerForRemoteNotifications()
}
```

**Step 1.** `Copy` and `Paste` above function and place it under `AppDelegate.swift` file of your project.

**Step 2.** Now under method, make sure you invoke above method.

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions 
			launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
	// Register for push notification
	self.registerForNotification(application)
	// Override point for customization after application launch.
	return true
}
```

**Step 3.** Also add following delegate methods to `AppDelegate.swift`

```swift
func application(_ application: UIApplication, 
		didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
	print("Need something to be done when success registring for APNS ")	
}
	
func application(_ application: UIApplication, 
	didFailToRegisterForRemoteNotificationsWithError error: Error) {
	print("Need something to be done when registring for APNS fails")		
}
```

**Step 4.** Make sure that you've enabled Push notification settings from Target Settings.

![Image for Push Notification Settings](http://sagarrkothari.com:12003/projects/publicwikipages/repository/revisions/master/entry/iOSCodeSnippets/InfoPlist/RegisterForPushNotificationiOS10.png)

Yep. That's it. Your app is all set for registering for push notifications.

Hope that helps. Cheers.