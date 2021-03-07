/*
 프로토콜을 사용하지 않고 옵저버 패턴 구현.
 */
/*
class ConcreteSubject {
    var value = 0
    
    var observers = [ConcreateObserver]()
    
    func attach(observer: ConcreateObserver) {
        observers.append(observer)
    }
    
    func detach(observer: ConcreateObserver) {
        observers.removeAll { element in
            element === observer
        }
    }
    
    func notify() {
        _ = observers.map { observer in
            observer.update(value: value)
        }
    }
    
    func updateValue(value: Int) {
        self.value = value
    }
}

class ConcreteObserver {
    let concreateSubject: ConcreateSubject
    
    init(concreateSubject: ConcreateSubject) {
        self.concreateSubject = concreateSubject
        concreateSubject.attach(observer: self)
    }
    
    func update(value: Int) {
        print("Update value: \(value)")
    }
}
*/
