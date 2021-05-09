class Solution {
    // 입력 문자열 필터링, 대문자 -> 소문자 및 숫자 표현 문자열로 변환
    private func filterString(_ string: String) -> String {
        var newString = ""
        for character in string {
            if character.isLetter {
                newString.append(character.lowercased())
            }
            if character.isNumber {
                newString.append(character)
            }
        }
        return newString
    }
    
    func isPalindrome(_ s: String) -> Bool {
        let filteredString = filterString(s)
        
        // 공백 문자열 검증, 미검증시 아래 인덱스 에러 발생
        if filteredString.isEmpty {
            return true
        }
        
        // 첫 인덱스 포인터
        var firstIndex = filteredString.startIndex
        // 마지막 인덱스 포인터
        var lastIndex = filteredString.index(before: filteredString.endIndex)
        
        // 첫 인덱스 포인터가 마지막 인덱스 포인터보다 크거나 같을 때까지
        while firstIndex < lastIndex {
            // palindrome이 아니면 false
            if filteredString[firstIndex] != filteredString[lastIndex] {
                return false
            }
            
            firstIndex = filteredString.index(after: firstIndex)
            lastIndex = filteredString.index(before: lastIndex)
        }
        
        // 지금까지 false가 아니면 true
        return true
    }
}

struct TestCase {
    let input = [
        "A man, a plan, a canal: Panama",
        "race a car",
        "a1b2c33c2b1a",
        "A1B1a",
        " ",
    ]
    
    let output = [
        true,
        false,
        true,
        true,
        true,
    ]
}
