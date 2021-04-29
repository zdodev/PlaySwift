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
}
