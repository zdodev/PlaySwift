struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let A = readInteger()
        let B = readInteger()
        let C = readInteger()
        let D = readInteger()
        let P = readInteger()
        
        let xPrice = P * A
        var yPrice = 0
        
        if P < C {
            yPrice = B
        } else {
            yPrice = B + (P - C) * D
        }
        
        if xPrice < yPrice {
            print(xPrice)
        } else {
            print(yPrice)
        }
    }
}

Solution().solution()
