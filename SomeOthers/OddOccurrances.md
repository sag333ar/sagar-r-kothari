```
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
