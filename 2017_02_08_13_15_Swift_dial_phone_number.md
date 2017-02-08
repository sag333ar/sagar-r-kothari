Following is a code snippet for dialing phone number through code in iOS Swift

```swift
@IBAction func btnDialPhone(_ sender: AnyObject) {
     if let url = URL(string: "tel://123456789"), UIApplication.shared.canOpenURL(url) {
               UIApplication.shared.openURL(url)
     }
}
```