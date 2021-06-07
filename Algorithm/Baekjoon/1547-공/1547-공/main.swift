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
        var ball = [true, false, false]
        
        let count = readInteger()
        
        for _ in 1...count {
            let input = readIntegers()
            ball.swapAt(input[0] - 1, input[1] - 1)
        }
        
        for index in 0...2 {
            if ball[index] == true {
                print(index + 1)
                break
            }
        }
    }
}

Solution().solution()
