public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

struct IsPalindrome {
    func method1(_ head: ListNode?) -> Bool {
        let array = listToValueArray(head)

        var index = 0
        for value in array.reversed() {
            if value != array[index] {
                return false
            }
            index += 1
        }
        
        return true
    }
    
    func method2(_ head: ListNode?) -> Bool {
        let array = listToValueArray(head)
        let reversedArray: [Int] = array.reversed()
        
        return array == reversedArray
    }
    
    private func listToValueArray(_ head: ListNode?) -> [Int] {
        var array = [Int]()
        var listNode = head
        
        while let node = listNode {
            array.append(node.val)
            listNode = listNode?.next
        }
        
        return array
    }
}

class Solution {
    let isPalindromeSolution = IsPalindrome()
    
    func isPalindrome(_ head: ListNode?) -> Bool {
//        isPalindromeSolution.method1(head)
        isPalindromeSolution.method2(head)
    }
}
