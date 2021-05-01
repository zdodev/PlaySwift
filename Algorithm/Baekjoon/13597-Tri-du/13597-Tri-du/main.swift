struct Solution {
    private func readInteger() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readInteger()
        
        if input[0] == input [1] {
            print(input[0])
            return
        }
        
        print(input.max()!)
    }
}

Solution().solution()
