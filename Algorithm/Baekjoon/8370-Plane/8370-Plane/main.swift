import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    func result(_ seats: [Int]) -> Int {
        let businessClassSeats = seats[0] * seats[1]
        let economicClassSeats = seats[2] * seats[3]
        return businessClassSeats + economicClassSeats
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
        [2, 5, 3, 20],
        [3, 4, 5, 6]
    ]
    let result = [
        70,
        42
    ]
}
