//MARK: -  Automatic Reference Counting
/*
 Swift는 메모리를 추적하고 관리하기 위해 ARC를 사용합니다. ARC는 메모리 관리를 자동으로 해주며 프로그래머가 생각할 필요가 없게 만들어줍니다. ARC는 클래스 인스턴스가 더 이상 필요하지 않은 경우 그 인스턴스가 사용하는 메모리를 자동으로 해제합니다.
 
 Swift ARC는 참조 타입인 클래스 인스턴스에만 적용됩니다. 갑 타입인 구조체와 열거형은 적용되지 않습니다.
 */

//MARK: - How ARC Works
/*
 새로운 클래스 인스턴스를 생성할 때마다, ARC는 인스턴스 정보에 대한 정보를 저장하는 chunk를 할당합니다.
 
 Reference Counting은 Swift의 메모리 관리 기법으로 메모리 관리 기법이란 동적 메모리를 자동으로 할당하고 해제하는 것을 말합니다.
 
 인스턴스가 더 이상 필요하지 않으면 ARC는 해당 인스턴스가 사용하는 메모리를 해제하여 메모리 공간을 확보합니다. 인스턴스가 존재하는 동안 ARC는 현재 각각의 클래스 인스턴스를 몇 개의 프로퍼티들이 참조하고 있는지 추적합니다. ARC는 해당 인스턴스에 대한 하나 이상의 참조가 존재하면 메모리에서 해제하지 않습니다.
 
 인스턴스 메모리 추적을 위해서 프로퍼티를 할당할 때마다 Strong Reference를 추가합니다.
 */

//MARK: - ARC in Action

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

// 초기화가 일어납니다. Strong Reference가 생겼습니다.
reference1 = Person(name: "John Appleseed")

// Strong Reference가 2개 더 생겼습니다.
reference2 = reference1
reference3 = reference1

// Strong Reference가 2개 삭제되었습니다.
// 아직 deinitializer가 호출되지 않았습니다.
reference1 = nil
reference2 = nil

// 하나 남은 Strong Reference가 삭제되었습니다.
// deinitializer가 호출됩니다.
reference3 = nil

//MARK: - Strong  Reference Cycles Between Class Instances
/*
 문제 1 - 인스턴스 사이에 Strong Reference Cycle이 발생할 수 있다.
 두 인스턴스가 서로를 Strong Reference로 참조하고 있을 경우 서로가 메모리에서 해제되지 않을 수 있습니다.
 */

class Person1 {
    let name: String
    // Apartment 타입 Strong Reference
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Apartment {
    let unit: String
    // Person1 타입 Strong Reference
    var tenant: Person1?
    
    init(unit: String) {
        self.unit = unit
    }
    
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

var john: Person1?
var unit4A: Apartment?

// person1 instance Reference Count 1
john = Person1(name: "John Appleseed")
// apartment instance Reference Count 1
unit4A = Apartment(unit: "4A")

// Strong Reference Cycle 발생
// apartment instance Reference Count 2
john!.apartment = unit4A
// person1 instance Reference Count 2
unit4A!.tenant = john

john = nil
unit4A = nil

/*
 Strong Reference Cycle은 메모리 leak을 유발합니다.
 */

//MARK: - Resolving Strong Reference Cycles Between Class Instances

//MARK: Weak References

//MARK: Unowned References

//MARK: Unowned Optional References

//MARK: Unowned References and Implicitly Unwrapped Optional Properties

//MARK: - Strong Reference Cycles for Closures

//MARK: - Resolving Strong Reference Cycles for Closures

//MARK: Defining a Capture List

//MARK: Weak and Unowned References
