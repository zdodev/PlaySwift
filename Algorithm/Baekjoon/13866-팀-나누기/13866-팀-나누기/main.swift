struct Solution {
    private func readIntergers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        var input = readIntergers()
        input.sort()
        
        let sumAWithD = input[0] + input[3]
        let sumBWithC = input[1] + input[2]
        print(abs(sumAWithD - sumBWithC))
    }
}

Solution().solution()
