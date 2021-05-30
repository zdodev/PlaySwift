struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let n = input[0]
        let m = input[1]
        
        if m == 1 || m == 2 {
            print("NEWBIE!")
        } else if m <= n {
            print("OLDBIE!")
        } else {
            print("TLE!")
        }
    }
}

Solution().solution()
