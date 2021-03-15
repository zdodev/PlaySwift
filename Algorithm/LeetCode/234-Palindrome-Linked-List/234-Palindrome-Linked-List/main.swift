public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

struct IsPalindrome {
    func method1(_ head: ListNode?) -> Bool {
        let array: [Int] = {
            var array = [Int]()
            var head = head
            
            while let node = head {
                array.append(node.val)
                head = head?.next
            }
            
            return array
        }()
        
        var index = 0
        for value in array.reversed() {
            print(value, array[index])
            if value != array[index] {
                return false
            }
            index += 1
        }
        
        return true
    }
}

class Solution {
    let isPalindromeSolution = IsPalindrome()
    
    func isPalindrome(_ head: ListNode?) -> Bool {
        isPalindromeSolution.method1(head)
    }
}
