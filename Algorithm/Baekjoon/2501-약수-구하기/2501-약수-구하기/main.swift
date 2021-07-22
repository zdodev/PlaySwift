struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let n = input[0]
        let k = input[1]
        
        var count = 0
        
        for index in 1...n {
            if n % index == 0 {
                count += 1
            }
            
            if count == k {
                print(index)
                return
            }
        }
        
        print(0)
    }
}

Solution().solution()
