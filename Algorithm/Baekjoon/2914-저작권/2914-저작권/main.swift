import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map { element in
            Int(element)!
        }
    }
    
    private func minimumSongs(_ number: Int, average: Int) -> Int {
        number * (average - 1) + 1
    }
    
    func result(_ input: [Int]) -> Int {
        minimumSongs(input[0], average: input[1])
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
        [38, 24],
        [1, 1],
        [100, 25]
    ]
    let result = [
        875,
        1,
        2401
    ]
}
