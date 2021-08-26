struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input1 = readIntegers()
        let input2 = readIntegers()
        let input3 = readIntegers()
        
        var x = 0
        var y = 0
        
        if input1[0] == input2[0] {
            x = input3[0]
        }
        
        if input2[0] == input3[0] {
            x = input1[0]
        }
        
        if input1[0] == input3[0] {
            x = input2[0]
        }
        
        if input1[1] == input2[1] {
            y = input3[1]
        }
        
        if input2[1] == input3[1] {
            y = input1[1]
        }
        
        if input1[1] == input3[1] {
            y = input2[1]
        }
        
        print("\(x) \(y)")
    }
}

Solution().solution()
