// MARK: - Deinitialization

// MARK: - How Deinitialization Works

// MARK: - Deinitializers in Action

class Cafe {
    var coffee: Coffee?
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    func deinitCoffee() {
        coffee = nil
    }
    
    func make() {
        let _ = Coffee()
    }
}

class Coffee {
    deinit {
        print("\(Self.self) deinit")
    }
}

let cafe = Cafe(coffee: Coffee())
// Coffee 인스턴스 해제 1
cafe.deinitCoffee()
// Coffee 인스턴스 해제 2
cafe.make()
