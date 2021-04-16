import Foundation

struct Solution {
    private func readIntegers() -> [Double] {
        readLine()!.components(separatedBy: " ").map {
            Double($0)!
        }
    }
    
    func calculateX(_ numbers: [Double]) -> Double {
        let statement = (numbers[0] * numbers[0]) / ((numbers[1] * numbers[1]) + (numbers[2] * numbers[2]))
        return sqrt(statement)
    }
    
    func calculateHeightAndWidth(_ x: Double, _ heightRate: Int, _ widthRate: Int) -> [Int] {
        let height = x * Double(heightRate)
        let width = x * Double(widthRate)
        return [Int(height), Int(width)]
    }
    
    func solution() {
        let input = readIntegers()
        let x = calculateX(input)
        let output = calculateHeightAndWidth(x, Int(input[1]), Int(input[2]))
        print("\(output[0]) \(output[1])")
    }
}

Solution().solution()

struct TestCase {
    let all = [
        [52, 9, 16]
    ]
    let result = [
        [25, 45]
    ]
}

