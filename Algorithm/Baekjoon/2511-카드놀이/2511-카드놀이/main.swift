struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let a = readIntegers()
        let b = readIntegers()
        
        var scoreA = 0
        var scoreB = 0
        var lastWinner = 0
        
        for index in 0..<10 {
            if a[index] > b[index] {
                scoreA += 3
                lastWinner = 1
            } else if a[index] < b[index] {
                scoreB += 3
                lastWinner = 2
            } else {
                scoreA += 1
                scoreB += 1
            }
        }
        
        print("\(scoreA) \(scoreB)")
        if scoreA > scoreB {
            print("A")
        } else if scoreA < scoreB {
            print("B")
        } else {
            if lastWinner == 1 {
                print("A")
            } else if lastWinner == 2 {
                print("B")
            } else {
                print("D")
            }
        }
    }
}

Solution().solution()
