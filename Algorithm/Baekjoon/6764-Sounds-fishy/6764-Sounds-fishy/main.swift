struct Solution {
    private func readIntegers() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        var depth = [Int]()
        for _ in 1...4 {
            depth.append(readIntegers())
        }
        
        if depth[0] < depth[1] && depth[1] < depth[2] && depth[2] < depth[3] {
            print("Fish Rising")
        } else if depth[0] > depth[1] && depth[1] > depth[2] && depth[2] > depth[3] {
            print("Fish Diving")
        } else if depth[0] == depth[1] && depth[1] == depth[2] && depth[2] == depth[3] {
            print("Fish At Constant Depth")
        } else {
            print("No Fish")
        }
    }
}

Solution().solution()
