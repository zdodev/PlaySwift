struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let n = input[0]
        let m = input[1]
        let k = input[2]
        
        if m < k {
            print(n * m)
        } else {
            print(n * ((k - 1) + (m / k)))
        }
    }
}

Solution().solution()
