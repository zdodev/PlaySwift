class Solution {
    func reorderLogFiles(_ logs: [String]) -> [String] {
        var digits = [String]()
        var letters = [String]()
        
        for log in logs {
            if log.split(separator: " ")[1].first!.isLetter {
                letters.append(log)
            } else {
                digits.append(log)
            }
        }
        
        letters.sort { string1, string2 in
            let firstIndex = string1.firstIndex(of: " ")!
            let sub1 = string1[firstIndex...]
            let secondIndex = string2.firstIndex(of: " ")!
            let sub2 = string2[secondIndex...]
            
            if sub1 < sub2 {
                return true
            } else if sub1 > sub2 {
                return false
            } else {
                let identifier1 = string1.split(separator: " ")[0]
                let identifier2 = string2.split(separator: " ")[1]
                if identifier1 < identifier2 {
                    return true
                } else {
                    return false
                }
            }
        }
        
        return letters + digits
    }
}

struct TestCase {
    let input = [
        ["dig1 8 1 5 1","let1 art can","dig2 3 6","let2 own kit dig","let3 art zero"],
        ["a1 9 2 3 1","g1 act car","zo4 4 7","ab1 off key dog","a8 act zoo"],
        ["j mo", "5 m w", "g 07", "o 2 0", "t q h"],
        
        
    ]
    let output = [
        ["let1 art can","let3 art zero","let2 own kit dig","dig1 8 1 5 1","dig2 3 6"],
        ["g1 act car","a8 act zoo","ab1 off key dog","a1 9 2 3 1","zo4 4 7"],
        ["5 m w","j mo","t q h","g 07","o 2 0"]
    ]
}

let a = "m w"
let b = "mo"

print(a < b)

let firstIndex = a.firstIndex(of: " ")!
print(a[firstIndex...])
