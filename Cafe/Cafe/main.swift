struct Customer {
    func order(menuName: String, menu: Menu, barista: Barista) {
        guard let menuItem = menu.choose(name: menuName) else {
            return
        }
        
        let coffee = barista.makeCoffee(menuItem: menuItem)
        print(coffee)
    }
}

class MenuItem {
    let name: String
    let price: Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
}

class Menu {
    private let items: [MenuItem]
    
    init(items: [MenuItem]) {
        self.items = items
    }
    
    func choose(name: String) -> MenuItem? {
        for item in items {
            if item.name == name {
                return item
            }
        }
        return nil
    }
}

class Barista {
    func makeCoffee(menuItem: MenuItem) -> Coffee {
        let coffee = Coffee(menuItem: menuItem)
        return coffee
    }
    
    func makeMilk(menuItem: MenuItem) -> Milk {
        let milk = Milk(menuItem: menuItem)
        return milk
    }
}

class Coffee {
    private let name: String
    private let price: Int
    
    init(menuItem: MenuItem) {
        self.name = menuItem.name
        self.price = menuItem.price
    }
}

class Milk {
    private let name: String
    private let price: Int
    
    init(menuItem: MenuItem) {
        self.name = menuItem.name
        self.price = menuItem.price
    }
}

let customer = Customer()
let menuItems: [MenuItem] = [MenuItem(name: "아메리카노", price: 1000)]
let menu = Menu(items: menuItems)
let barista = Barista()
customer.order(menuName: "아메리카노", menu: menu, barista: barista)
customer.order(menuName: "카페라떼", menu: menu, barista: barista)
