//
//  main.swift
//  LeetCode344ReverseString
//
//  Created by Zero DotOne on 2021/01/11.
//

/*
 344. Reverse String
 Write a function that reverses a string. The input string is given as an array of characters char[].
 
 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
 
 You may assume all the characters consist of printable ascii characters.
 */

import Foundation

protocol Solving {
    func reverseString(_ s: inout [Character])
}

class Solution1: Solving {
    func reverseString(_ s: inout [Character]) {
        s.reverse()
    }
}

class Solution2: Solving {
    func reverseString(_ s: inout [Character]) {
        var (leftIndex, rightIndex) = (0, s.count - 1)
        while leftIndex < rightIndex {
            (s[leftIndex], s[rightIndex]) = (s[rightIndex], s[leftIndex])
            leftIndex += 1
            rightIndex -= 1
        }
    }
}
