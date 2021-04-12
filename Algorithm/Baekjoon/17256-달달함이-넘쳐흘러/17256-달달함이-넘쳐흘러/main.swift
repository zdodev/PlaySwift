import Foundation

struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let a = readIntegers()
        let c = readIntegers()
        var b = [Int]()
        b.append(c[0] - a[2])
        b.append(c[1] / a[1])
        b.append(c[2] - a[0])
        print("\(b[0]) \(b[1]) \(b[2])")
    }
}

Solution().solution()
