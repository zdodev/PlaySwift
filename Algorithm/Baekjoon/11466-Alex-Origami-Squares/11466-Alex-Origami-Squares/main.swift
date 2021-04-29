import Foundation

struct Solution {
    private func readIntegers() -> [Double] {
        readLine()!.components(separatedBy: " ").map {
            Double($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let h = input.max()!
        let w = input.min()!
        
        if h >= 3 * w {
            print(w)
        } else if 10 * h >= 15 * w {
            print(h / 3)
        } else {
            print(w / 2)
        }
    }
}

Solution().solution()
