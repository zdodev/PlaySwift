struct Solution {
    var k = [0]
    var tn = [0]
    var fn = [0]
    var wn = [0]
    
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    mutating func solution() {
        var sum = 0
        
        for index in 1...301 {
            k.append(index)
            
            sum += index
            tn.append(sum)
        }
        
        for index in 1...300 {
            fn.append(k[index] * tn[index + 1])
        }
        
        sum = 0
        for index in 1...300 {
            sum += fn[index]
            wn.append(sum)
        }
        
        let testcase = readInteger()
        
        for _ in 1...testcase {
            let index = readInteger()
            print(wn[index])
        }
    }
}

var solution = Solution()
solution.solution()
