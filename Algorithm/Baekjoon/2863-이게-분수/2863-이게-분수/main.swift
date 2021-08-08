struct Solution {
    private func readDoubles() -> [Double] {
        readLine()!.split(separator: " ").map {
            Double($0)!
        }
    }
    
    func solution() {
        let input1 = readDoubles()
        let input2 = readDoubles()
        
        var a = input1[0]
        var b = input1[1]
        var c = input2[0]
        var d = input2[1]
        
        var results = [Double]()
        
        results.append(a / c + b / d)
        
        for _ in 1...3 {
            let temp = b
            b = a
            a = c
            c = d
            d = temp
            
            results.append(a / c + b / d)
        }
        
        let index = results.firstIndex { element in
            element == results.max()!
        }!
        
        print(index)
    }
}

Solution().solution()
