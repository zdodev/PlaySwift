struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        var winnerNumber = 0
        var winnerSum = 0
        
        for index in 1...5 {
            let sum = readIntegers().reduce(0) { result, element in
                result + element
            }
            
            if sum > winnerSum {
                winnerSum = sum
                winnerNumber = index
            }
        }
        
        print("\(winnerNumber) \(winnerSum)")
    }
}

Solution().solution()
