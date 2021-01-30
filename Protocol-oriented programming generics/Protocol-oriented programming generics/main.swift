//
//  main.swift
//  Protocol-oriented programming generics
//
//  Created by Zero DotOne on 2021/01/29.
//

import Foundation

enum Color: String {
    case red = "red"
    case green = "green"
    case blue = "blue"

    // A computed property. Note that enums cannot contain stored properties.
    var hint: String {
        switch self {
        case .red:
            return "Roses are this color."
        case .green:
            return "Grass is "
        case .blue:
            return "The ocean is this color."
        }
    }
    
    // An initializer like for classes.
    init?(color: String) {
        switch color {
        case "red":
            self = .red
        case "green":
            self = .green
        case "blue":
            self = .blue
        default:
            return nil
        }
    }
}

// Can extend the enum as well!
extension Color {
    // A function
    func hintFunc() -> String {
        self.hint
    }
}

let c = Color.red
print("Give me a hint for c: \(c.hintFunc())")

let invalidColor = Color(color: "orange")
print("is invalidColor nil: \(invalidColor == nil)")


struct FastCar {
    // Can have variables and constants as stored properties.
    var color: Color
    let horsePower: Int
    // Can have computed properties.
    var watts: Float {
        Float(horsePower) * 745.7
    }
    // Can have lazy variables like in classes!
    lazy var titleCaseColorString: String = {
        let colorString = color.rawValue
        return colorString.prefix(1).uppercased() + colorString.lowercased().dropFirst()
    }()
    // A function.
    func description() -> String {
        "This is a \(color) car with \(horsePower) horse power!"
    }
    // Can create a variety of initializers.
    init(color: Color, horsePower: Int) {
        self.color = color
        self.horsePower = horsePower
    }
    // Can define extra initializers other than the default one.
    init?(color: String, horsePower: Int) {
        guard let enumColor = Color(color: color) else {
            return nil
        }
        self.color = enumColor
        self.horsePower = horsePower
    }
}

var car = FastCar(color: .red, horsePower: 250)
print(car.description())
print("Horse power in watts: \(car.watts)")
print(car.titleCaseColorString)

class A {
    var a = "A"
}

func foo(_ a: A) {
    a.a = "foo"
}
let a = A()
print(a.a)
foo(a)
print(a.a)

protocol Car {
    var color: Color { get set }
    var price: Int { get }
    func turnOn()
    mutating func drive()
}

protocol Electric {
    mutating func recharge()
    // precentage of the battery level, 0~100%.
    var batteryLevel: Int { get set }
}

protocol Gas {
    mutating func refill()
    // # of liters the car is holding, varies b/w models.
    var gasLevelLiters: Int { get set }
}

/*
 In an object-oriented world (with no multiple inheritance), you may have made Electric and Gas abstract classes then used class inheritance to make both inherit from Car, and then have a specific car model be a base class. However, here both are completely separate protocols with zero coupling! This makes the entire system more flexible in how you design it.
 */

struct TeslaModelS: Car, Electric {
    var color: Color
    let price: Int
    var batteryLevel: Int
    
    func turnOn() {
        print("Starting all systems!")
    }
    
    mutating func drive() {
        print("Self driving engaged!")
        batteryLevel -= 8
    }
    
    mutating func recharge() {
        print("Racharging the battery...")
        batteryLevel = 100
    }
}

var tesla = TeslaModelS(color: .red, price: 110000, batteryLevel: 100)

struct Mustang: Car, Gas {
    var color: Color
    var price: Int
    var gasLevelLiters: Int
    
    func turnOn() {
        print("Starting all systems!")
    }
    
    mutating func drive() {
        print("Time do drive!")
        gasLevelLiters -= 1
    }
    
    mutating func refill() {
        print("Filling the tank...")
        gasLevelLiters = 25
    }
}

var mustang = Mustang(color: .red, price: 30000, gasLevelLiters: 25)

extension Electric {
    mutating func recharge() {
        print("Recharging the battery...")
        batteryLevel = 100
    }
}

// 메서드 구현을 강제하지 않음.
protocol Default {
//    func foo()
}

extension Default {
    func foo() {
        print("A default")
    }
}

struct DefaultStruct: Default {
    func foo() {
        print("Inst")
    }
}
// 메서드 구현을 강제하지 않았을 때 발생하는 문제점은?
let b: Default = DefaultStruct()
b.foo()



// https://www.tensorflow.org/swift/tutorials/protocol_oriented_generics#extend_protocols_with_default_behaviors

struct OldEletric: Car, Electric {
    var color: Color
    let price: Int
    var batteryLevel: Int
    
    func turnOn() {
        print("Starting all systems!")
    }
    
    mutating func drive() {
        print("Self driving engaged!")
        batteryLevel -= 8
    }
    
    mutating func recharge() {
        print("Recharging the battery...")
        batteryLevel = 90
    }
}
