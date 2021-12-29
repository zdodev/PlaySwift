//
//  fp1.swift
//  Funtional-Programming
//
//  Created by admin on 2021/12/29.
//

import Foundation

struct FP1 {
    // an old-school function
    func hello() {
        print("Hello!")
    }
    
    // it's a block!
    let hi: () -> Void = {
        print("Hi!")
    }
    
    // closure parameter
    func async(completion: () -> Void) {
        completion()
    }
    
    // function composition
    func increment(_ x: Int) -> Int {
        x + 1
    }
    
    // function currying
    func decrement(_ x: Int) -> (Int) -> Int {
        { $0 * x }
    }
    
    // this is a variadic function that accepts a block as a parameter
    func variadic(_ blocks: (() -> Void)...) {
        for block in blocks {
            block()
        }
        
//        blocks.forEach { block in
//            block()
//        }
    }
    
    // a function that takes another function as a parameter
    func transform(value: Int, _ transformation: (Int) -> Int) -> Int {
        transformation(value)
    }
    
    // a function that returns another function
    func increase(withMultiplication shouldMultiply: Bool) -> (Int, Int) -> Int {
        func add(_ x: Int, _ y: Int) -> Int { x  + y }
        func multiply(_ x: Int, _ y: Int) -> Int { x * y }
        return shouldMultiply ? multiply : add
    }
    
    // this only works for integers
    func chooseInt(_ x: Int, or y: Int) -> Int {
        Bool.random() ? x : y
    }
    
    // whoa, this is a generic function
    func choose<T>(_ x: T, or y: T) -> T {
        Bool.random() ? x : y
    }
    
    func main() {
        // this points to a function
        let function = hello
        
        // this is a copy of the closure
        let block = hi
        
        hello() // simple function call
        function() //call through "function pointer"
        
        hi() // simple closure call
        block() // closure call through another variable
        
        // calling the method with a closure
        async(completion: {
            print("Completed.")
        })
        
        // trailing closure syntax
        async {
            print("Completed.")
        }
        
        // function composition
        let x = increment(increment(increment(increment(10))))
        print(x)
        
        // function currying
        let y = decrement(10)(1)
        print(y)
        
        // it means you can pass as many parameters as you want...
        variadic(
            { print("a") },
            { print("b") },
            { print("c") }
        )
        
        // lol, trailing closure syntax works with variadic block params.
        variadic {
            print("d")
            print("e")
            print("f")
        }
        
        let xa = transform(value: 10) { value in
            value * 2
        }
        print(xa)
        
        let ya = increase(withMultiplication: true)(10, 10)
        print(ya)
        
        // 1 or 2, but who knows this for sure
        let xb = chooseInt(1, or: 2)
        print(xb)
        
        // maybe heads or maybe tails
        let yb = choose("heads", or: "tails")
        print(yb)
    }
}
