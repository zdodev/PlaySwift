struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input1 = readIntegers()
        let input2 = readIntegers()
        
        if input1[1] < input2[1] {
            print(input2[0] - input1[0])
        } else if input1[1] == input2[1] {
            if input1[2] <= input2[2] {
                print(input2[0] - input1[0])
            } else {
                print(input2[0] - input1[0] - 1)
            }
        } else {
            print(input2[0] - input1[0] - 1)
        }
        
        print(input2[0] - input1[0] + 1)
        print(input2[0] - input1[0])
    }
}

Solution().solution()
