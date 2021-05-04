struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input1 = readIntegers()
        let input2 = readIntegers()
        
        let minX = [input1[0], input1[2], input2[0], input2[2]].min()!
        let maxX = [input1[0], input1[2], input2[0], input2[2]].max()!
        let minY = [input1[1], input1[3], input2[1], input2[3]].min()!
        let maxY = [input1[1], input1[3], input2[1], input2[3]].max()!
        
        let intervalX = maxX - minX
        let intervalY = maxY - minY
        
        let bigger = intervalX >= intervalY ? intervalX : intervalY
        print(bigger * bigger)
    }
}

Solution().solution()
