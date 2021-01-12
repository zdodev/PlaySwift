//
//  main.swift
//  LeetCode125ValidPalindrome
//
//  Created by Zero DotOne on 2021/01/11.
//

/*
 125. Valid Palindrome
 
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
 
 Note: For the purpose of this problem, we define empty string as valid palindrome.
 */

import Foundation

protocol Solving {
    func isPalindrome(_ s: String) -> Bool
}

class Solution1: Solving {
    func isPalindrome(_ s: String) -> Bool {
        let lowercasedString = s.lowercased()
        let newString = extractLettersAndNumbers(lowercasedString)
        
        guard !newString.isEmpty else {
            return true
        }
        
        var (leftIndex, rightIndex) = (newString.startIndex, newString.index(before: newString.endIndex))
        while leftIndex < rightIndex {
            if newString[leftIndex] != newString[rightIndex] {
                return false
            }
            leftIndex = newString.index(after: leftIndex)
            rightIndex = newString.index(before: rightIndex)
        }

        return true
    }
    
    private func extractLettersAndNumbers(_ lowercasedString: String) -> String {
        return lowercasedString.filter {
            $0.isLetter || $0.isNumber
        }
    }
}

class Solution2: Solving {
    func isPalindrome(_ s: String) -> Bool {
        let lowerString = s.lowercased()
        let alnumString = lowerString.replacingOccurrences(of: "[^a-z0-9]", with: "", options: .regularExpression)
        let reversedString = String(alnumString.reversed())
        
        return alnumString == reversedString
    }
}
