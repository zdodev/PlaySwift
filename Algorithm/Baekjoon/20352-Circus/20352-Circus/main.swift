import Foundation

struct Solution {
    private func readDouble() -> Double {
        Double(readLine()!)!
    }
    
    func solution() {
        let input = readDouble()
        let r = sqrt(input / Double.pi)
        
        print(2 * Double.pi * r)
    }
}

Solution().solution()
