struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let month = readInteger()
        let day = readInteger()
        
        if month == 1 {
            print("Before")
            return
        }
        
        if month >= 3 {
            print("After")
            return
        }
        
        if day <= 17 {
            print("Before")
        } else if day >= 19 {
            print("After")
        } else {
            print("Special")
        }
    }
}

Solution().solution()
