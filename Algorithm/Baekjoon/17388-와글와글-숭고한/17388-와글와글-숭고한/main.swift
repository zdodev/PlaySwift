struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func solution() {
        let input = readIntegers()
        
        let sum = input.reduce(0) { result, element in
            result + element
        }
        
        var participationDict = [Int: String]()
        participationDict[input[0]] = "Soongsil"
        participationDict[input[1]] = "Korea"
        participationDict[input[2]] = "Hanyang"
        
        if sum >= 100 {
            print("OK")
        } else {
            print(participationDict[input.min()!]!)
        }
    }
}

Solution().solution()
