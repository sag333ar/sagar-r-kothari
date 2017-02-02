### Put following swift extension of `UIView` class in project

```Swift
extension UIView {

	var screenShot: UIImage? {
		UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
		layer.render(in: UIGraphicsGetCurrentContext()!)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return image
	}

}
```

# Download Source code

Run following command to download source code along with working sample project.

```
svn checkout https://github.com/sag333ar/sagarrkothari.com.git/trunk/2017\:02\:02\:take-a-screenshot-of-uiview-code-snippet\:
```