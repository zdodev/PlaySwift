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
