import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        let input = readLine()!.components(separatedBy: " ").map { element in
            Int(element)!
        }
        return input
    }
    
    func result() -> Int {
        let integers = readIntegers()
        let multiplication = integers.reduce(1) { (result, element) in
            result * element
        }
        return multiplication
    }
}

print(Solution().result())
