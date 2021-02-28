// 직원 채용
class Employee {
    let name = "zdo"
    // CEO가 누구지?
    var CEO: CEO?
    
    init(CEO: CEO) {
        self.CEO = CEO
    }
    
    // 일 해야겠다
    func startWork() {
        // CEO한테 일 할 사람으로 등록
        CEO?.delegate = self
        // CEO의 주문 처리
        CEO?.order()
        print("할 일 끝")
    }
    
    func printCEOname() {
        print(CEO?.name ?? "noname")
    }
}

extension Employee: WorkDelegate {
    // 그렇지만 할 일은 내가 정한다.
    func work(_ sender: CEO) {
        print("CEO \(sender.name)의 지시")
        print("빡코딩 중")
    }
}
