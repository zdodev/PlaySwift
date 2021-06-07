struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        
        var firstColumn = input[0] % 4
        if firstColumn == 0 {
            firstColumn = 4
        }
        var secondColumn = input[1] % 4
        if secondColumn == 0 {
            secondColumn = 4
        }
        
        let columnDistance = abs(firstColumn - secondColumn)
        
        var firstRow = input[0] / 4
        if input[0] % 4 == 0 {
            firstRow -= 1
        }
        var secondRow = input[1] / 4
        if input[1] % 4 == 0 {
            secondRow -= 1
        }
        
        let rowDistance = abs(firstRow - secondRow)
        
        print(columnDistance + rowDistance)
    }
}

Solution().solution()
