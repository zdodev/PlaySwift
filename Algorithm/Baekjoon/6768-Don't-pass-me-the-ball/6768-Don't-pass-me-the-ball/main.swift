struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    private func calculateCombination(_ n: Int) -> Int {
        var n1 = n
        let nr = n - 3
        var nFac = 1
        while n1 > nr {
            nFac *= n1
            n1 -= 1
        }
        
        let rFac = 6
        return nFac / rFac
    }
    
    func solution() {
        let input = readInteger()
        
        if input <= 3 {
            print(0)
            return
        }
        
        let n = input - 1
        
        let output = calculateCombination(n)
        print(output)
    }
}

Solution().solution()
