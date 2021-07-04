struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let max = input.max()!
        
        let candyCount = input.reduce(0) { result, element in
            let restCandy = result + max - element
            return restCandy
        }
        
        print(candyCount)
    }
}

Solution().solution()
