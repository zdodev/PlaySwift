struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let n = input[0]
        let w = input[1]
        let h = input[2]
        let l = input[3]
        
        let widthCount = w / l
        let heightCount = h / l
        let totalCount = widthCount * heightCount
        
        if totalCount <= n {
            print(totalCount)
        } else {
            print(n)
        }
    }
}

Solution().solution()
