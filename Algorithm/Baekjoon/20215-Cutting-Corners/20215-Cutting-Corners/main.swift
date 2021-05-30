import Foundation

struct Solution {
    private func readDoubles() -> [Double] {
        readLine()!.split(separator: " ").map {
            Double($0)!
        }
    }
    
    func solution() {
        let input = readDoubles()
        let widthAndHeight = input[0] + input[1]
        let diagonal = sqrt(input[0] * input[0] + input[1] * input[1])
        print(widthAndHeight - diagonal)
    }
}

Solution().solution()
