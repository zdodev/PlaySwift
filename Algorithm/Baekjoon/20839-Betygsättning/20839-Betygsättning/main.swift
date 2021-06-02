struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let base = readIntegers()
        let input = readIntegers()
        
        if base[0] == input[0] && base[1] == input[1] && base[2] == input[2] {
            print("A")
        } else if base[1] == input[1] && base[2] == input[2] {
            var baseA = 0
            if base[0] % 2 == 0 {
                baseA = base[0] / 2
            } else {
                baseA = base[0] / 2 + 1
            }
            
            if input[0] >= baseA {
                print("B")
            } else {
                print("C")
            }
        } else if base[2] == input[2] {
            var baseC = 0
            if base[1] % 2 == 0 {
                baseC = base[1] / 2
            } else {
                baseC = base[1] / 2 + 1
            }
            
            if input[1] >= baseC {
                print("D")
            } else {
                print("E")
            }
        }
    }
}

Solution().solution()
