struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: "/").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let k = input[0]
        let d = input[1]
        let a = input[2]
        
        if k + a < d || d == 0 {
            print("hasu")
        } else {
            print("gosu")
        }
    }
}

Solution().solution()
