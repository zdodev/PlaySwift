import Foundation

struct Solution {
    private func readDouble() -> Double {
        Double(readLine()!)!
    }
    
    func solution() {
        let input = readDouble()
        
        let side = sqrt(input)
        print(4 * side)
    }
}

Solution().solution()
