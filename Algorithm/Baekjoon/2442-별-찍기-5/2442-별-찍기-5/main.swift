struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        let n = 2 * input - 1
        var lastIndex = input
        
        for index1 in 1...input {
            for index2 in 1...lastIndex {
                let leftIndex = input - index1
                let rightIndex = input - index1
                if index2 <= leftIndex || index2 >= n - rightIndex + 1 {
                    print(" ", terminator: "")
                } else {
                    print("*", terminator: "")
                }
            }
            lastIndex += 1
            print("")
        }
    }
}

Solution().solution()
