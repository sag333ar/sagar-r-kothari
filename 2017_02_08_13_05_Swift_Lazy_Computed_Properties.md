#### Example of Lazy properties with tuples

In this wiki-page, I have illustrated Lazy property, tuples and computed properties.

#### Lazy Property

```Swift
class MyViewController: UIViewController {

	lazy var arrayOfData: [(name String, fullName: String)] = {
		return self.names
	}()
}
```

#### Computed property returning array of tuples

```Swift
extension MyViewController {
	var names: [(name: String, fullName: String)] {
		return [
			("Sagar", "Sagar Rajesh Kothari"),
			("Amit", "Amit Rajesh Kothari"),
			("Vishal", "Vishal Rajesh Kothari")
		]
	}
```