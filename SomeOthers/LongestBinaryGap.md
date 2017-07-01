```swift
// A function which will generate Binary value in form of string from given number
public func getBinaryString(_ N: Int) -> String {
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
}

// A function which will process binary given in form of String and returns an array of gaps
public func getArrayOfGaps(_ string: String) -> [Int]{
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
    return arrayOfZeroCounts
}

// A function which will find the maximum value from given array
public func getMax(_ fromArray: [Int]) -> Int {
	// find maximum from array
    var max = 0
    for value in fromArray {
        if value > max {
            max = value
        }
    }
    // return max
    return max
}

// Longest binary gap
public func solution(_ N: Int) -> Int {
	// get binary value from given number
    let string = getBinaryString(N)
    // Take an array which will hold gap-values
    let arrayOfZeroCounts: [Int] = getArrayOfGaps(string)
    // return maximum value
    return getMax(arrayOfZeroCounts)
}
// A test data
print(solution(529))
```