import Foundation

struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        let A = 300
        let B = 60
        let C = 10
        
        if input % C != 0 {
            print(-1)
            return
        }
        
        var temporary = input
        
        let outputA = temporary / A
        temporary %= A
        let outputB = temporary / B
        temporary %= B
        let outputC = temporary / C
        
        print("\(outputA) \(outputB) \(outputC)")
    }
}

Solution().solution()
