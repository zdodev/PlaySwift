import Foundation

struct Solution {
    func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map { element in
            Int(element)!
        }
    }
    
    func square(_ number: Int) -> Int {
        number * number
    }
    
    func sumOfSquares(_ numbers: [Int]) -> Int {
        numbers.map { number in
            square(number)
        }.reduce(0) { number, result in
            result + number
        }
    }
    
    func identifierNumber(_ number: Int) -> Int {
        number % 10
    }
    
    func result(_ numbers: [Int]) -> Int {
        let sumOfSquare = sumOfSquares(numbers)
        let result = identifierNumber(sumOfSquare)
        return result
    }
    
    func solution() {
        let input = readIntegers()
        print(result(input))
    }
}

Solution().solution()

struct TestCase {
    let all = [
        [0, 4, 2, 5, 6],
        [0, 0, 0, 0, 0],
        [9, 9, 9, 9, 9]
    ]
    let result = [
        1,
        0,
        5
    ]
}
