class Solution {
    private let keyPad = [
        "2": "abc",
        "3": "def",
        "4": "ghi",
        "5": "jkl",
        "6": "mno",
        "7": "pqrs",
        "8": "tuv",
        "9": "wxyz",
    ]
    
    func solution(_ input: String) -> [String] {
        if input.isEmpty {
            return []
        }
        
        var result = [String]()
        
        let array = input.map {
            String($0)
        }
        
        func dfs(_ index: Int, _ path: String) {
            if path.count == array.count {
                result.append(path)
                return
            }
            
            for i in index..<array.count {
                for j in keyPad[array[i]]! {
                    dfs(i + 1, path + String(j))
                }
            }
        }
        
        dfs(0, "")
        return result
    }
    
    func letterCombinations(_ digits: String) -> [String] {
        solution(digits)
    }
}

struct TestCase {
    let testCase = [
        "23",
        "",
        "2",
    ]
    
    let output = [
        ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"],
        [],
        ["a", "b", "c"]
    ]
}
