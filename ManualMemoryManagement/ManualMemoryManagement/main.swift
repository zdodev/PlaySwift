struct Value {
    var member: Int
    
    init(_ member: Int) {
        self.member = member
    }
}

class Reference {
    var member: Int
    
    init(_ member: Int) {
        self.member = member
    }
}

func temp() {
    var value = Value(3)
    var reference = Reference(6)
    
    // 힙에 생성된 인스턴스 주소를 출력
    print(Unmanaged.passUnretained(reference).toOpaque())

    // 스택에 생성된 reference의 주소 출력(인스턴스의 주소를 담고 있다)
    withUnsafePointer(to: &reference) {
        print($0)
    }

    // 스택에 생성된 value의 주소 출력(내부 프로퍼티의 값을 가지고 있다)
    withUnsafePointer(to: &value) {
        print($0)
    }
    
    print("")
}

temp()
