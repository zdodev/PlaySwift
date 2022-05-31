struct Cafe {
    let coffee1: Coffee
    let coffee2: Coffee
}

struct Coffee {
    let name: String
}

let coffee1 = Coffee(name: "coffee1")
let coffee2 = Coffee(name: "coffee2")
let cafe = Cafe(coffee1: coffee1, coffee2: coffee2)

func getCoffee(cafe: Cafe, keyPath: KeyPath<Cafe, Coffee>) -> Coffee {
    cafe[keyPath: keyPath]
}

let myCoffee1 = getCoffee(cafe: cafe, keyPath: \.coffee1)
print(myCoffee1)
let myCoffee2 = getCoffee(cafe: cafe, keyPath: \.coffee2)
print(myCoffee2)
