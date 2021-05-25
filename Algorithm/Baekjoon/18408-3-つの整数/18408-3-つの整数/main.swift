struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        
        var one = 0
        var two = 0
        
        input.forEach { element in
            if element == 1 {
                one += 1
            } else if element == 2 {
                two += 1
            }
        }
        
        let result = one >= two ? 1 : 2
        print(result)
    }
}

Solution().solution()
