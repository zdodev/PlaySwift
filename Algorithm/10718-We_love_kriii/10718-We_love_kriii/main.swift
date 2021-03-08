class Solution {
    private func makeString() -> String {
        "강한친구 대한육군"
    }
    
    // 1. 순환호출 사용
    func result1(repeatCount: Int) {
        if repeatCount == 0 {
            return
        }
        print(makeString())
        result1(repeatCount: repeatCount - 1)
    }
    
    // 2. 반복문 사용
    func result2() {
        for _ in 1...2 {
            print(makeString())
        }
    }
    
    // 3. forEach 메서드 사용
    func result3() {
        let strings = makeStringArray()
        
        strings.forEach { element in
            print(element)
        }
    }
    
    private func makeStringArray() -> [String] {
        Array(repeating: makeString(), count: 2)
    }
}

//Solution().result1(repeatCount: 2)
//Solution().result2()
//Solution().result3()

