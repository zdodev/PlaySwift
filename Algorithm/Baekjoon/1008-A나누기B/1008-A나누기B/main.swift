import Foundation

struct Solution {
    private func readDoubles() -> [Double] {
        let input = readLine()!.components(separatedBy: " ").map { element in
            Double(element)!
        }
        return input
    }
    
    func result() -> Double {
        let doubles = readDoubles()
        return doubles[0] / doubles[1]
    }
}

print(Solution().result())
