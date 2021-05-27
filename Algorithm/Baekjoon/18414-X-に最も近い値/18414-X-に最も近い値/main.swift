struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let range = input[1]...input[2]
        let x = input[0]
        
        if range.contains(x) {
            print(x)
        } else {
            let leftDistance = abs(input[1] - x)
            let rightDistance = abs(input[2] - x)
            
            if leftDistance < rightDistance {
                print(input[1])
            } else {
                print(input[2])
            }
        }
    }
}

Solution().solution()
