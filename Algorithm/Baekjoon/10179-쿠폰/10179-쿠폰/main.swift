import Foundation

struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    private func readDouble() -> Double {
        Double(readLine()!)!
    }
    
    func solution() {
        let count = readInteger()
        
        for _ in 1...count {
            let price = readDouble()
            let discountedPrice = price * 0.8
            let doubleToString = String(format: "%.2f", discountedPrice)
            print("$" + doubleToString)
        }
    }
}

Solution().solution()
