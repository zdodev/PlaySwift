struct Solution {
    let dictionary: [Character: Int] = [
        "-": 0,
        "\\": 1,
        "(": 2,
        "@": 3,
        "?": 4,
        ">": 5,
        "&": 6,
        "%": 7,
        "/": -1,
    ]
    
    private func readString() -> String {
        readLine()!
    }
    
    func solution() {
        var input = readString()
        while input != "#" {
            var length = input.count - 1
            var sum = 0
            for character in input {
                let variable = pow(8, length)
                sum += dictionary[character]! * variable
                length -= 1
            }
            print(sum)
            input = readString()
        }
    }
    
    func pow(_ x: Int, _ y: Int) -> Int {
        if y == 0 {
            return 1
        }
        
        var variable = 1
        for _ in 1...y {
            variable *= x
        }
        
        return variable
    }
}

Solution().solution()
