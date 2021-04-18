// 배열로 구현된 스택
struct Stack<T> {
    private var elements = [T]()
    
    // push 연산
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    // pop 연산
    mutating func pop() -> T? {
        elements.popLast()
    }
    
    // peek 연산
    func peek() -> T? {
        elements.last
    }
    
    // count 연산
    func count() -> Int {
        elements.count
    }
    
    // isEmpty 연산
    func isEmpty() -> Bool {
        elements.isEmpty
    }
}
