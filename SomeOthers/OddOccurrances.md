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

Run following code to execute above functions

```swift
print("\(NSDate().description) \(solution([9,3,9,3,9,7,9]))")
print("\(NSDate().description) \(solution([2, 3, 5, 4, 5, 2, 4, 3, 5, 2, 4, 4, 2]))")
print("\(NSDate().description) \(solution([1, 1, 2, 2, 1, 1, 2, 2, 13, 1, 1, 40, 40, 13, 13]))")
print("\(NSDate().description) \(solution([1, 1, 2, 2, 3, 3, 4, 4, 3, 600, 600, 4, 4]))")
```

