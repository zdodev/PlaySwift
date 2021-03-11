import Foundation

struct Solution {
    private func readInteger() -> [Int] {
        let input = readLine()!.components(separatedBy: " ").map { element in
            Int(element)!
        }
        return input
    }
    
    func result() -> Int {
        let integers = readInteger()
        let subtraction = integers[0] - integers[1]
        return subtraction
    }
}

print(Solution().result())
