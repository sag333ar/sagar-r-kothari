```swift
// Longest binary gap
public func solution(_ N: Int) -> Int {
    // Take temporary variable. This will be used to generate binary number from Int
    var n = N
    // This string variable will be holding actual binary value of given number
    var string = ""
    // A loop to generate binary number
    while n > 0 {
        let remainder = n % 2
        string = "\(remainder)\(string)"
        n = n / 2
    }
    // Take an array which will hold gap-values
    var arrayOfZeroCounts: [Int] = []
    // A temporary variable which will count the length of gap
    var count = 0
    // Process to count the gap & add it to array.
    for i in 1..<string.characters.count {
        // Substring logic
        let startIndex = string.index(string.startIndex, offsetBy: i)
        let endIndex = string.index(string.endIndex, offsetBy: -(string.characters.count-1-i))
        let range = startIndex..<endIndex
        // if found `1`, save count value to array & reset count
        if string.substring(with: range) == "1" {
            arrayOfZeroCounts.append(count)
            count = 0
        } else {
        // else increase gap length value
            count = count + 1
        }
    }
    // find maximum gap length from array
    var max = 0
    for value in arrayOfZeroCounts {
        if value > max {
            max = value
        }
    }
    // return max gap length
    return max
}
// A test data
print(solution(529))
```