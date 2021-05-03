struct Solution {
    private func readString() -> String {
        readLine()!
    }
    
    func solution() {
//        let input = readString()
        var count = 0
        for _ in 1...6 {
            let input = readString()
            if input == "W" {
                count += 1
            }
        }
        
        if count == 5 || count == 6 {
            print(1)
        } else if count == 3 || count == 4 {
            print(2)
        } else if count == 1 || count == 2 {
            print(3)
        } else {
            print(-1)
        }
    }
}

Solution().solution()
