struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            String($0)
        }.filter {
            isInteger($0)
        }.map {
            Int($0)!
        }
    }
    
    private func isInteger(_ string: String) -> Bool {
        let integer = Int(string)
        
        return integer != nil ? true : false
    }
    
    func solution() {
        let input1 = readIntegers()
        let input2 = readIntegers()
        
        let startTime = input1[0] * 3600 + input1[1] * 60 + input1[2]
        let endTime = input2[0] * 3600 + input2[1] * 60 + input2[2]
        
        var totalTime = 0
        
        if endTime < startTime {
            totalTime = 86400 - startTime + endTime
        } else {
            totalTime = endTime - startTime
        }
        
        print(totalTime)
    }
}

Solution().solution()
