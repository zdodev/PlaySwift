struct Solution {
    private func readInteger() -> [Int] {
        let input = readLine()!.split(separator: " ").map { subString in
            Int(subString)!
        }
        return input
    }
    
    func result() -> Int {
        let integers = readInteger()
        let sum = integers.reduce(0) { result, element in
            result + element
        }
        return sum
    }
}

print(Solution().result())
