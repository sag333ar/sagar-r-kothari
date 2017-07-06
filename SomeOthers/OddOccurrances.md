#### Following solution works for both performance and correctness

```swift
  public func solution(_ A: [Int]) -> Int {
    var result = 0
    for i in 0..<A.count {
      result = result ^ A[i]
    }
    return result
  }
```

##### Following logic works perfectly but has performance issues

```swift
public func solution(_ A: [Int]) -> Int {
  var A = A.sorted()
  var foundElement = false
  while !foundElement {
    let firstElement = A[0]
    let arrayWithoutElement = A.filter { $0 != firstElement }
    if arrayWithoutElement.count % 2 == 1 {
      if arrayWithoutElement.count == 1 {
        foundElement = true
        return firstElement
      } else {
        A = arrayWithoutElement
      }
    } else {
      foundElement = true
      return firstElement
    }
  }
}
```
