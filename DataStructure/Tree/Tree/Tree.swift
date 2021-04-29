class BinaryTreeNode<T: Comparable> {
    var value: T
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    weak var parent: BinaryTreeNode?
    
    init(value: T, leftChild: BinaryTreeNode? = nil, rightChild: BinaryTreeNode? = nil, parent: BinaryTreeNode? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
        self.parent = parent
    }
    
    func insertNodeFromRoot(value: T) {
        if let _ = parent {
            print("not root node.")
            return
        }
        
        addNode(value: value)
    }
    
    private func addNode(value: T) {
        if value < self.value {
            if let leftChild = leftChild {
                leftChild.addNode(value: value)
            } else {
                let newNode = BinaryTreeNode(value: value)
                newNode.parent = self
                leftChild = newNode
            }
        } else {
            if let rightChild = rightChild {
                rightChild.addNode(value: value)
            } else {
                let newNode = BinaryTreeNode(value: value)
                newNode.parent = self
                rightChild = newNode
            }
        }
    }
    
    func traverseInOrder(node: BinaryTreeNode?) {
        guard let node = node else {
            return
        }
        
        traverseInOrder(node: node.leftChild)
        print(node.value)
        traverseInOrder(node: node.rightChild)
    }
    
    func traversePreOrder(node: BinaryTreeNode?) {
        guard let node = node else {
            return
        }
        
        print(node.value)
        traversePreOrder(node: node.leftChild)
        traversePreOrder(node: node.rightChild)
    }
    
    func traversePostOrder(node: BinaryTreeNode?) {
        guard let node = node else {
            return
        }
        
        traversePostOrder(node: node.leftChild)
        traversePostOrder(node: node.rightChild)
        print(node.value)
    }
}
