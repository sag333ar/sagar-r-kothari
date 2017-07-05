```swift
public func solution(_ A: [Int], _ K : Int) -> [Int] {
    if A.count == 0 || A.count == 1 || K == 0 {
        return A
    }
    var B: [Int] = A
    for i in 0..<A.count {
        B[(i+K) % A.count] = A[i]
    }
    return B
}
print(solution([3, 8, 9, 7, 6], 3))
```

For given input Array A = [3, 8, 9, 7, 6] & shift right K = 3,
Output is as follows
```
[9, 7, 6, 3, 8]
```