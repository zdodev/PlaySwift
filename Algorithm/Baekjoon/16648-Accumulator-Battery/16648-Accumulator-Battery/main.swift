struct Solution {
    private func readIntegers() -> [Double] {
        readLine()!.split(separator: " ").map {
            Double($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let t = input[0]
        let p = input[1]
        
        var b = 0.0
        var lastTime = 0.0
        if p > 20 {
            b = t / (100 - p)
            lastTime = (p - 20) * b + 20 * 2 * b
        } else {
            b = t / ((20 - p) * 2 + 80)
            lastTime = p * b * 2
        }
        print(lastTime)
    }
}

Solution().solution()
