struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let r = input[0]
        let c = input[1]
        let n = input[2]
        
        var row = r / n
        if r % n != 0 {
            row += 1
        }
        
        var column = c / n
        if c % n != 0 {
            column += 1
        }
        
        print(row * column)
    }
}

Solution().solution()
