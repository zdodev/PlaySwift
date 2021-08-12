struct Solution {
    private func readString() -> String {
        readLine()!
    }
    
    func solution() {
        var input1 = readString()
        let op = readString()
        var input2 = readString()
        
        var sum = ""
        
        if op == "*" {
            for _ in 1..<input2.count {
                input1 += "0"
            }
            print(input1)
            return
        } else {
            if input1.count == input2.count {
                sum = "2"
                for _ in 1..<input1.count {
                    sum += "0"
                }
            } else {
                let max = input1 > input2 ? input1 : input2
                let second = input1 < input2 ? input1 : input2
                var index = max.count
                
                while index > 0 {
                    if index == max.count {
                        sum += "1"
                    } else if index == second.count {
                        sum += "1"
                    } else {
                        sum += "0"
                    }
                    
                    index -= 1
                }
            }
            print(sum)
            return
        }
    }
}

Solution().solution()
