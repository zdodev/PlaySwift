struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        let a = input[0]
        let b = input[1]
        let c = input[2]
        
        var result = 0
        
        result = b + c
        if a == result {
            print("\(a)=\(b)+\(c)")
        }
        result = b - c
        if a == result {
            print("\(a)=\(b)-\(c)")
        }
        result = b * c
        if a == result {
            print("\(a)=\(b)*\(c)")
        }
        result = b / c
        if a == result {
            print("\(a)=\(b)/\(c)")
        }
        
        result = a + b
        if c == result {
            print("\(a)+\(b)=\(c)")
        }
        result = a - b
        if c == result {
            print("\(a)-\(b)=\(c)")
        }
        result = a * b
        if c == result {
            print("\(a)*\(b)=\(c)")
        }
        result = a / b
        if c == result {
            print("\(a)/\(b)=\(c)")
        }
    }
}

Solution().solution()
