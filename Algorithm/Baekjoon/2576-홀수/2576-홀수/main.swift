struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        var numbers = [Int]()
        
        for _ in 1...7 {
            let input = readInteger()
            
            if input % 2 == 1 {
                numbers.append(input)
            }
        }
        
        if numbers.isEmpty {
            print(-1)
            return
        }
        
        let sum = numbers.reduce(0) { result, element in
            result + element
        }
        print(sum)
        print(numbers.min()!)
    }
}

Solution().solution()
