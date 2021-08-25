struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input1 = readIntegers()
        let input2 = readIntegers()
        
        let a = input1[0]
        let b = input1[1]
        let c = input1[2]
        let d = input1[3]
        
        let p = input2[0]
        let m = input2[1]
        let n = input2[2]
        
        var remainder1 = 0
        var remainder2 = 0
        var attackCount = 0
        
        remainder1 = p % (a + b)
        remainder2 = p % (c + d)
        
        if remainder1 <= a && remainder1 > 0 {
            attackCount += 1
        }
        if remainder2 <= c && remainder2 > 0 {
            attackCount += 1
        }
        
        print(attackCount)
        
        attackCount = 0
        
        remainder1 = m % (a + b)
        remainder2 = m % (c + d)
        
        if remainder1 <= a && remainder1 > 0 {
            attackCount += 1
        }
        if remainder2 <= c && remainder2 > 0 {
            attackCount += 1
        }
        
        print(attackCount)
        
        attackCount = 0
        
        remainder1 = n % (a + b)
        remainder2 = n % (c + d)
        
        if remainder1 <= a && remainder1 > 0 {
            attackCount += 1
        }
        if remainder2 <= c && remainder2 > 0 {
            attackCount += 1
        }
        
        print(attackCount)
    }
}

Solution().solution()
