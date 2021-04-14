import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let output = input.map {
            $0 * 5
        }.reduce(0) { (result, element) in
            result + element
        }
        print(output)
    }
}

Solution().solution()
