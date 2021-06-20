struct Solution {
    let arrayLength = 1_000_001
    lazy var sieveOfEratosthenesArray: [Bool] = {
        var array = Array(repeating: false, count: arrayLength)
        
        for index in 2...1_001 {
            if array[index] == false {
                var nextPrimeNumber = index * 2
                while nextPrimeNumber < arrayLength {
                    array[nextPrimeNumber] = true
                    nextPrimeNumber += index
                }
            }
        }
        
        return array
    }()
    var k = ""
    var result = 0
    
    private func readString() -> [String] {
        readLine()!.split(separator: " ").map {
            String($0)
        }
    }
    
    private mutating func divide() {
        for index in 2..<arrayLength {
            if sieveOfEratosthenesArray[index] == false {
                if mod(index) {
                    break
                }
            }
        }
    }
    
    private mutating func mod(_ number: Int) -> Bool {
        var ret = 0
        
        for element in k {
            ret = (ret * 10 + Int(String(element))!) % number
        }
        
        if ret == 0 {
            result = number
            return true
        } else {
            return false
        }
    }
    
    mutating func solution() {
        let input = readString()
        k = input[0]
        let l = Int(input[1])!
        
        divide()

        if result == 0 {
            print("GOOD")
        } else {
            if result < l {
                print("BAD \(result)")
            } else {
                print("GOOD")
            }
        }
    }
}

var solution = Solution()
solution.solution()
