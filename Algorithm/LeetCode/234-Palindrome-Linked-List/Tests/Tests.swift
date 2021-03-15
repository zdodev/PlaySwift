import XCTest

class Tests: XCTestCase {
    let solution = Solution()
    let model = Model()
    
    func testModel1() {
        let result = solution.isPalindrome(model.head[0])
        let expectedValue = true
        XCTAssertEqual(result, expectedValue, "model 1 실패.")
    }
    
    func testModel2() {
        let result = solution.isPalindrome(model.head[1])
        let expectedValue = false
        XCTAssertEqual(result, expectedValue, "model 2 실패.")
    }
}

struct Model {
    let head: [ListNode] = {
        var node = [ListNode]()
        
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(2)
        let node4 = ListNode(1)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        
        node.append(node1)
        
        let node5 = ListNode(1)
        let node6 = ListNode(2)
        
        node5.next = node6
        
        node.append(node5)
        
        return node
    }()
}

/*
 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }
 */
