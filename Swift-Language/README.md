# Swift-Language

---

Swift Lanuage Guide 정리 및 유용한 문법에 대한 기록입니다.

### 상속과 오버라이드 메서드 호출 방식

사용할 프로퍼티의 타입이 상위 클래스 타입이더라도 프로퍼티에 실제 할당된 객체가 하위 클래스일 경우, 프로퍼티에서 메서드를 호출할 때 하위 클래스의 메서드가 호출됩니다.(하위 클래스가 오버라이드한 메서드일 경우) 다음 예시가 있습니다.

```swift
class Money {
    let amount: Int
    
    init(_ amount: Int) {
        self.amount = amount
    }
    
    func times(_ multiplier: Int) -> Money {
        Money(0)
    }
    
    static func dollar(_ amount: Int) -> Money {
        Dollar(amount)
    }
}

extension Money: Equatable {
    static func == (lhs: Money, rhs: Money) -> Bool {
        return lhs.amount == rhs.amount && type(of: lhs) == type(of: rhs)
    }
}

class Dollar: Money {
    override func times(_ multiplier: Int) -> Dollar {
        Dollar(amount * multiplier)
    }
}

let money: Money = Money.dollar(5)
print(Dollar(10) == money.times(2))
// true
```

Money 클래스의 dollar 타입 메서드는 Dollar 인스턴스를 생성하여 Money 타입으로 반환합니다. 실제 인스턴스는 Dollar입니다. 29번째 줄에서 Money 타입의 money 변수에 Dollar 인스턴스를 생성하여 Money 타입으로 할당하고 있습니다. 이 경우 money의 times() 메서드를 호출하면 Money 타입의 times() 메서드가 호출될거라고 생각했습니다. 그러나 실제로는 Dollar 타입의 times() 메서드가 호출됩니다. 이러한 이유는 Dollar 타입에서 times() 메서드를 오버라이드를 하여 구현하고 있고, 실제 반환된 타입은 Dollar이기 때문입니다. 그러므로 반환된 인스턴스에서 해당 타입이 오버라이드하여 구현한 메서드를 호출하려고 하면 실제 오버라이드한 메서드가 호출됩니다.
