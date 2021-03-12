protocol Subject {
    func attach(observer: Observer)
    func detach(observer: Observer)
    func notify()
}

protocol Observer: class {
    func update(value: Int)
}

final class ConcreteSubject: Subject {
    private var observers = [Observer]()
    private var value = 0
    
    func attach(observer: Observer) {
        observers.append(observer)
    }
    
    func detach(observer: Observer) {
        observers.removeAll(where: { element in
            element === observer
        })
    }
    
    func notify() {
        _ = observers.map({ observer in
            observer.update(value: value)
        })
    }
    
    func update(value: Int) {
        self.value = value
        notify()
    }
}

final class ObserverA: Observer {
    private let concreteSubject: ConcreteSubject
    
    init(concreteSubject: ConcreteSubject) {
        self.concreteSubject = concreteSubject
        concreteSubject.attach(observer: self)
    }
    
    func update(value: Int) {
        print("ObserverA class update, value: \(value)")
    }
}

final class ObserverB: Observer {
    private let concreteSubject: ConcreteSubject
    
    init(concreteSubject: ConcreteSubject) {
        self.concreteSubject = concreteSubject
        concreteSubject.attach(observer: self)
    }
    
    func update(value: Int) {
        print("ObserverB class update, value: \(value)")
    }
}

let concreateSubject = ConcreteSubject()
let observerA = ObserverA(concreteSubject: concreateSubject)
let observerB = ObserverB(concreteSubject: concreateSubject)

concreateSubject.update(value: 3)
concreateSubject.detach(observer: observerB)
concreateSubject.update(value: 5)
 
