struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let p1 = input[0]
        let q1 = input[1]
        let p2 = input[2]
        let q2 = input[3]
        let isAreaInteger = (p1 * p2 % (q1 * q2 * 2)) == 0
        
        if isAreaInteger {
            print(1)
        } else {
            print(0)
        }
    }
}


Solution().solution()

