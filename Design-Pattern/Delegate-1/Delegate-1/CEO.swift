// CEO 생성
class CEO {
    let name = "lasagne"
    // 일 시킬 사람 구함
    var delegate: WorkDelegate?
    
    // 일 시켜야지
    func order() {
        print("일해라 zdo")
        // 일해라
        delegate?.work(self)
    }
}

protocol WorkDelegate {
    // 할 일
    func work(_ sender: CEO)
}
