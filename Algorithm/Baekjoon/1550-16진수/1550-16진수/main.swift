import Foundation

struct Solution {
    private func readInput() -> String {
        readLine()!
    }
    
    func hexStringToDecimal(_ hex: String) -> Int {
        Int(hex, radix: 16)!
    }
    
    func result() {
        let input = readInput()
        let decimal = hexStringToDecimal(input)
        print(decimal)
    }
}

Solution().result()

struct TestCase {
    let testCase = [
        ("1", 1),
        ("A", 10),
        ("F", 15),
        ("FF", 255)
    ]
}
