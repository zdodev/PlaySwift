struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        var array = [Int]()
        for _ in 1...input {
            array.append(readInteger())
        }
        array.reverse()
        
        var max = array[0]
        var count = 1
        for number in array {
            if number > max {
                count += 1
                max = number
            }
        }
        
        print(count)
    }
}

Solution().solution()
