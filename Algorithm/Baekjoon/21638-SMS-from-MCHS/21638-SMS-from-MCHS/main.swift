struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let today = readIntegers()
        let tomorrow = readIntegers()
        
        if tomorrow[0] < 0 && tomorrow[1] >= 10 {
            print("A storm warning for tomorrow! Be careful and stay home if possible!")
        } else if tomorrow[0] < today[0] {
            print("MCHS warns! Low temperature is expected tomorrow.")
        } else if tomorrow[1] > today[1] {
            print("MCHS warns! Strong wind is expected tomorrow.")
        } else {
            print("No message")
        }
    }
}

Solution().solution()
