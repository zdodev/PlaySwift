struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    private func readString() -> String {
        readLine()!
    }
    
    func solution() {
        while true {
            let input = readString()
            if input == "0" {
                break
            }
            
            let countOne = input.filter { character in
                character == "1"
            }.count
            
            let countZero = input.filter { character in
                character == "0"
            }.count
            
            print(2 + input.count - 1 + (input.count - countOne - countZero) * 3 + countOne * 2 + countZero * 4)
        }
    }
}

Solution().solution()
