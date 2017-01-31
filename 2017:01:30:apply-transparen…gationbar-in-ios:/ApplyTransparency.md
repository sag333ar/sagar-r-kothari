### Put following lines of code in your class

```Objective-C
- (void)applyTransparencyToNavigationControllersBar:(UINavigationController *)nvCtr {
    nvCtr.navigationBar.translucent = YES;
    nvCtr.navigationBar.shadowImage = [UIImage new];
    nvCtr.view.backgroundColor = [UIColor clearColor];
    [nvCtr.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    nvCtr.navigationBar.backgroundColor = [UIColor clearColor];
}
```

```Swift
func applyTransparencyToNavigationControllersBar(_ nvCtr: UINavigationController) {
	nvCtr.navigationBar.isTranslucent = true
	nvCtr.navigationBar.shadowImage = UIImage()
	nvCtr.view.backgroundColor = UIColor.clear
	nvCtr.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
	nvCtr.navigationBar.backgroundColor = UIColor.clear
}
```

# Download Source code

Run following command.

```
svn checkout https://github.com/sag333ar/sagarrkothari.com.git/trunk/2017\:01\:30\:apply-transparen…gationbar-in-ios\:
```