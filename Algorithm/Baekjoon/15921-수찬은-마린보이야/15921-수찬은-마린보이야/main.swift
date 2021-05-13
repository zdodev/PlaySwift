import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        if input == 0 {
            print("divide by zero")
            return
        }
        
        let inputs = readIntegers()
        let average = inputs.reduce(0) { result, element in
            result + Double(element)
        } / Double(input)
        
        let expectation = inputs.map { element in
            Double(element) / Double(input)
        }.reduce(0) { result, element in
            result + element
        }
        
        let result = average / expectation
        let roundedResult = round(result * 100) / 100
        let toString = String(format: "%.2f", roundedResult)
        print(toString)
    }
}

Solution().solution()
