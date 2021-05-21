struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func checkNumber(_ number: Int) -> Bool {
        let result = cutNumber(number)
        
        return check555(result)
    }
    
    func solution() {
        let input = readInteger()
        let result = checkNumber(input)
        if result {
            print("YES")
        } else {
            print("NO")
        }
    }
    
    private func cutNumber(_ number: Int) -> Int {
        var number = number
        let first = number / 1_000_000
        number %= 1_000_000
        let second = number / 100_000
        number %= 100_000
        let third = number / 10_000
        
        return first * 100 + second * 10 + third
    }
    
    private func check555(_ result: Int) -> Bool {
        result == 555 ? true : false
    }
}

Solution().solution()
