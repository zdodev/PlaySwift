struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let a = input[0]
        let b = input[1]
        let c = input[2]
        
        var total = 0
        var count = 0
        while total < c {
            count += 1
            if count % 7 != 0 {
                total += a
            } else {
                total += a + b
            }
        }
        
        print(count)
    }
}

Solution().solution()
