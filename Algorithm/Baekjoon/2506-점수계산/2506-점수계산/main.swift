struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let n = readInteger()
        let score = readIntegers()
        
        var totalScore = 0
        var previousScore = 0
        var inc = 1
        
        for index in 0..<n {
            if score[index] == 1 {
                if previousScore == 1 {
                    inc += 1
                    totalScore += inc
                } else {
                    totalScore += 1
                }
            } else {
                inc = 1
            }
            
            previousScore = score[index]
        }
        
        print(totalScore)
    }
}

Solution().solution()
