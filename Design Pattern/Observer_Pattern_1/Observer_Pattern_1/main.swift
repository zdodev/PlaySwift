protocol Subject {
    func registerObserver(observer: Observer)
    func removeObserver(observer: Observer)
    func notifyObservers()
}

protocol Observer: class {
    func update(value: Int)
}

class ConcreateSubject: Subject {
    var observers = [Observer]()
    var value: Int = 0
    
    func registerObserver(observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(observer: Observer) {
        observers.removeAll(where: { element in
            element === observer
        })
    }
    
    func notifyObservers() {
        _ = observers.compactMap({ observer in
            observer.update(value: value)
        })
    }
    
    func updateValue(value: Int) {
        self.value = value
        notifyObservers()
    }
}

class ObserverA: Observer {
    let concreateSubject: ConcreateSubject
    
    init(concreateSubject: ConcreateSubject) {
        self.concreateSubject = concreateSubject
        concreateSubject.registerObserver(observer: self)
    }
    
    func update(value: Int) {
        print("ObserverA class update, value: \(value)")
    }
}

class ObserverB: Observer {
    let concreateSubject: ConcreateSubject
    
    init(concreateSubject: ConcreateSubject) {
        self.concreateSubject = concreateSubject
        concreateSubject.registerObserver(observer: self)
    }
    
    func update(value: Int) {
        print("ObserverB class update, value: \(value)")
    }
}

let concreateSubject = ConcreateSubject()
let observerA = ObserverA(concreateSubject: concreateSubject)
let observerB = ObserverB(concreateSubject: concreateSubject)

concreateSubject.notifyObservers()
concreateSubject.updateValue(value: 3)
