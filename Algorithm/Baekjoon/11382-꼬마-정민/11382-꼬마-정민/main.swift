import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map { element in
            Int(element)!
        }
    }
    
    private func addNumbers(_ numbers: [Int]) -> Int {
        numbers.reduce(0) { (result, element) -> Int in
            result + element
        }
    }
    
    func solution() {
        let input = readIntegers()
        let output = addNumbers(input)
        print(output)
    }
}

Solution().solution()
