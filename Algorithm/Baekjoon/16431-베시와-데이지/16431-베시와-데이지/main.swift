struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        var b = readIntegers()
        let d = readIntegers()
        let j = readIntegers()
        
        if b[0] < j[0] && b[1] > j[1] {
            b = [j[0] + j[0] - b[0], b[1]]
        }
        if b[0] < j[0] && b[1] < j[1] {
            b = [j[0] + j[0] - b[0], j[1] + j[1] - b[1]]
        }
        if b[0] > j[0] && b[1] < j[1] {
            b = [b[0], j[1] + j[1] - b[1]]
        }
        
        var bd = 0
        if b[0] - j[0] < b[1] - j[1] {
            bd = b[0] - j[0]
            bd += b[1] - j[1] - bd
        } else {
            bd = b[1] - j[1]
            bd += b[0] - j[0] - bd
        }
        
        let dd = abs(d[0] - j[0]) + abs(d[1] - j[1])
        
        if bd < dd {
            print("bessie")
        } else if bd > dd {
            print("daisy")
        } else {
            print("tie")
        }
    }
}

Solution().solution()
