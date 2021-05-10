//MARK: -  Automatic Reference Counting

//MARK: - How ARC Works

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

// 인스턴스 생성됩니다. 현재 strong reference는 1입니다.
reference1 = Person(name: "John Appleseed")

// strong reference가 2증가합니다. 총 3입니다.
reference2 = reference1
reference3 = reference1

// strong reference 1 감소합니다. 나머지 2
reference1 = nil
// strong reference 1 감소합니다. 나머지 1
reference2 = nil
// 아직 deinitializer가 호출되지 않았습니다.

// 하나 남은 strong reference가 감소합니다. 나머지 0
reference3 = nil
// deinitializer가 호출됩니다.

//MARK: - Strong Reference Cycles Between Class Instances

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

// person1 인스턴스가 생성됩니다. 현재 reference count는 1입니다.
john = Person1(name: "John Appleseed")
// apartment 인스턴스가 생성됩니다. 현재 reference count는 1입니다.
unit4A = Apartment(unit: "4A")

// apartment 인스턴스의 reference count는 2입니다.
john!.apartment = unit4A
// person 인스턴스의 reference count는 2입니다.
unit4A!.tenant = john
// strong reference cycle 발생

// person 인스턴스의 reference count는 1이 됩니다.
john = nil
// apartment 인스턴스의 reference count는 1이 됩니다.
unit4A = nil
// deinitializer가 호출되지 않습니다.
// 인스턴스 간의 strong reference로 인해 인스턴스가 메모리에서 해제되지 않습니다.

//MARK: - Resolving Strong Reference Cycles Between Class Instances
/*
 Swift의 Strong Reference Cycle을 해결하기 위한 두 가지 방법을 제공합니다. 하나는 Weak Reference와 다른 하나는 Unowned Reference입니다.
 
 Weak Reference와 Unowned Reference는 인스턴스를 참조할 때 Reference Counting을 증가시키지 않습니다.
 
 Weak Reference는 인스턴스의 수명이 짧을 때 사용하고, Unowned Reference는 인스턴스의 수명이 길 때 사용합니다.
 */

//MARK: Weak References
/*
 Weak Reference는 인스턴스 Reference Counting을 증가시키지 않으며 Weak Reference로 인스턴스를 참조하고 있더라도 ARC가 인스턴스 메모리를 정리합니다. Weak Reference는 정의 앞에 weak 키워드를 붙여서 선언합니다. ARC는 인스턴스를 정리할 때 해당 인스턴스를 Weak Reference 참조하고 있는 프로퍼티에 자동으로 nil을 할당합니다.
 
 Weak Reference 프로퍼티는 실행 중에 nil을 할당할 수 있어야 하기 때문에 var 옵셔널로 선언해야 합니다.
 
 ⭐️ ARC가 프로퍼티에 nil을 할당할 경우 Property Observer가 호출되지 않습니다.
 */

class Person2 {
    let name: String
    // Apartment 타입 Strong Reference
    var apartment: Apartment1?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Apartment1 {
    let unit: String
    weak var tenant: Person2?
    
    init(unit: String) {
        self.unit = unit
    }
    
    deinit {
        print("Apartment1 \(unit) is being deinitialized")
    }
}

var john1: Person2?
var unit4A1: Apartment1?

// Reference Count 1
john1 = Person2(name: "John Appleseed")
// Reference Count 1
unit4A1 = Apartment1(unit: "4A")

// unit4A1 Reference Count 2
john1!.apartment = unit4A1
// john1 Reference Count 1
unit4A1!.tenant = john1

// 인스턴스 해제
john1 = nil
// 인스턴스가 해제되었으므로 ARC가 tenant 프로퍼티에 nil을 할당
print(unit4A1?.tenant)
// nil

// 인스턴스 해제
unit4A1 = nil

//MARK: Unowned References
/*
 unowned reference도 참조하는 인스턴스의 reference couting을 증가시키지 않습니다. unowned reference는 unowned 키워드를 붙여서 선언합니다.
 
 unowned reference는 weak reference와 다르게 항상 인스턴스가 존재한다고 생각하고 접근합니다. 그래서 unowned reference는 옵셔널이 될 수 없으며, ARC도 unowned reference 프로퍼티를 nil로 설정하지 않습니다.
 
 unowned reference는 인스턴스가 절대 해제되지 않을 거라고 생각될 때 사용합니다. 만약 인스턴스가 해제되어 메모리에서 제거된 후 unowned reference 프로퍼티로 접근하면 런타임 에러가 발생합니다.
 */

class Customer {
    let name: String
    // 👀 신용카드는 옵셔널
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    // 👀 고객은 Unowned Reference
    unowned private let customer: Customer
    
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

// joy는 customer 인스턴스를 strong reference로 참조합니다.
// customer 인스턴스는 creditcard 인스턴스를 strong reference로 참조합니다.
// creditcard 인스턴스는 customer를 unowned reference로 참조합니다.
var joy: Customer? = Customer(name: "John Appleseed")
joy!.card = CreditCard(number: 1234_5678_9012_3456, customer: joy!)
// joy가 customer 인스턴스 참조를 해제하면 reference counting이 0이 되어 customer 인스턴스는 메모리에서 해제됩니다.
joy = nil

/*
 위 예제는 런타임 안전성 검사를 하는 safe unowned reference에 대한 예시입니다.
 */

//MARK: Unsafe Unowned References
/*
 Swift에서는 런타임 안전성 검사를 비활성화하는 unsafe unowned reference도 제공합니다. unsafe unowned reference는 unowned(unsafe) 키워드를 붙여서 선언합니다.
 
 unsafe unowned reference는 인스턴스가 해제되어도 해당 메모리에 접근합니다.
 */

//MARK: Unowned Optional References

//MARK: Unowned References and Implicitly Unwrapped Optional Properties

//MARK: - Strong Reference Cycles for Closures

//MARK: - Resolving Strong Reference Cycles for Closures

//MARK: Defining a Capture List

//MARK: Weak and Unowned References
