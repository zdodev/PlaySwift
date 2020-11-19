class Fruit {
    let fruiteName: String
    var 수량: Int
    
    init(name: String) {
        fruiteName = name
        수량 = 10
    }
    
    func addStock(amount: Int) {
        수량 += amount
    }
}

class FruitStock {
    var strawberry = Fruit(name: "strawberry")
    var banana = Fruit(name: "banana")
    var dict = [String: Fruit]()
    var array: [Fruit]
    var fruit = 1
    
    init() {
        dict["strawberry"] = strawberry
        dict["banana"] = banana
        
        array = [strawberry, banana]
    }
    
    func addStock(fruitsName: String, amount: Int) {
        if let fruit = dict[fruitsName] {
            fruit.addStock(amount: amount)
        }
    }
    
    func addStock1(fruitsName: Int, amount: Int) {
        let fruit = array[fruitsName]
        fruit.addStock(amount: amount)
    }
}

var fruitStock = FruitStock()
fruitStock.addStock(fruitsName: "strawberry", amount: 30)
print("딸기 \(fruitStock.strawberry.수량)")
fruitStock.addStock(fruitsName: "banana", amount: 10)
print("바나나 \(fruitStock.banana.수량)")

fruitStock.addStock1(fruitsName: 0, amount: 50)
print(fruitStock.array[0].수량)
