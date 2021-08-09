struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        var n = input[0]
        var m = input[1]
        var k = input[2]
        
        if n == 0 || m == 0 {
            print(0)
            return
        }
        
        while k > 0 {
            if n > 2 * m {
                n -= 1
                k -= 1
            } else if n < 2 * m {
                m -= 1
                k -= 1
            } else {
                n -= 1
                k -= 1
            }
            
            if n == 0 || m == 0 {
                print(0)
                return
            }
        }
        
        if n == 0 || m == 0 {
            print(0)
            return
        }
        
        if n < 2 * m {
            print(n / 2)
        } else if n > 2 * m {
            print(m)
        } else {
            print(m)
        }
    }
}

Solution().solution()
