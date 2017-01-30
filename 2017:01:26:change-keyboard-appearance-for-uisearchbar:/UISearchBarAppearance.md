## How to change UISearchBar Keyboard Appearance?

Just paste following code snip & call function

### Objective-C code

```
+ (void)changeSearchBarColor:(UISearchBar *)searchBar {
   for (UIView *subview in searchBar.subviews) {
       for (UIView *subSubview in subview.subviews) {
           if ([subSubview conformsToProtocol:@protocol(UITextInputTraits)]) {
               UITextField *textField = (UITextField *)subSubview;
               [textField setKeyboardAppearance: UIKeyboardAppearanceAlert];
               break;
           }
       }
   }
}
```

### Swift code

```
extension ViewController: UISearchBarDelegate {

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        ViewController.changeSearchBarKeyboardColor(searchBar)
    }

    public class func changeSearchBarKeyboardColor(_ searchBar: UISearchBar) {
        for subview in searchBar.subviews {
            for innerView in subview.subviews {
                if let _ = innerView as? UITextInputTraits,
                    let textField = innerView as? UITextField {
                    textField.keyboardAppearance = .alert
                }
            }
        }
    }
}
```

[Browse source code](https://github.com/sag333ar/sagarrkothari.com/tree/master/2017:01:26:change-keyboard-appearance-for-uisearchbar:)

Cheers
