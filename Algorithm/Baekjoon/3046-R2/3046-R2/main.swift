import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map { element in
            Int(element)!
        }
    }
    
    private func calculateR2(_ r1: Int, _ s: Int) -> Int {
        s * 2 - r1
    }
    
    func result(_ input: [Int]) -> Int {
        calculateR2(input[0], input[1])
    }
    
    func solution() {
        let input = readIntegers()
        let output = result(input)
        print(output)
    }
}

Solution().solution()

struct TestCase {
    let all = [
        [11, 15],
        [4, 3],
        [1000, 1000],
        [1000, -1000],
        [-1000, 1000],
        [-1000, -1000]
    ]
    let result = [
        19,
        2,
        1000,
        -3000,
        3000,
        -1000
    ]
}
