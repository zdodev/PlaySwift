import Foundation

struct Solution {
    private func readDouble() -> Double {
        Double(readLine()!)!
    }
    
    func solution() {
        let mile = readDouble()
        let mileLiter = 100.0 / (mile * (1.609344 / 3.785411784))
        print(String(format: "%.6f", mileLiter))
    }
}

Solution().solution()
