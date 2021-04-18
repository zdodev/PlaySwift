class Node<T> {
    let data: T
    fileprivate var next: Node?
    weak var previous: Node?
    
    init(_ data: T) {
        self.data = data
    }
}

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    mutating func append(value: T) {
        let newNode = Node(value)
        
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        
        tail = newNode
    }
    
    func nodeAt(index: Int) -> Node<T>? {
        if index >= 0 {
            var node = head
            var i = index
            
            while node != nil {
                if i == 0 {
                    return node
                }
                i -= 1
                node = node!.next
            }
        }
        
        return nil
    }
    
    func isEmpty() -> Bool {
        head == nil
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.data)"
            node = node!.next
            if node != nil {
                text += ", "
            }
        }
        
        return text + "]"
    }
}
