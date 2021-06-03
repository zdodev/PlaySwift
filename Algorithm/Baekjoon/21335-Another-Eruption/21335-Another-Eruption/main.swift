import Foundation

struct Solution {
    private func readDouble() -> Double {
        Double(readLine()!)!
    }
    
    func solution() {
        let area = readDouble()
        let radius = sqrt(area / Double.pi)
        let circumference = 2 * Double.pi * radius
        print(circumference)
    }
}

Solution().solution()
