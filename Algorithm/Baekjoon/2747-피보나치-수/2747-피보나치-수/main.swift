import Foundation

struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        
        var n3 = 0
        var n2 = 1
        var n1 = 1
        
        for index in 1...input {
            if index == 1 || index == 2 {
                n3 = 1
                continue
            }
            
            n3 = n1 + n2
            n1 = n2
            n2 = n3
        }
        
        print(n3)
    }
}

Solution().solution()
