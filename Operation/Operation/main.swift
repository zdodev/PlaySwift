//
//  main.swift
//  Operation
//
//  Created by Zero DotOne on 2021/01/15.
//

import Foundation

class Calculator: Operation {
    /// non-concurrent task
    override func main() {
        for index in 1...5 {
            print("\(index)...🌸")
        }
    }
}

class Calculator1: Operation {
    /// non-concurrent task
    override func main() {
        for index in 1...5 {
            print("\(index)...🌷")
        }
    }
}

class Calculator2: Operation {
    /// non-concurrent task
    override func main() {
        for index in 1...5 {
            print("\(index)...🌺")
        }
    }
}

let operationQueue = OperationQueue()

let calculator1 = Calculator()
let calculator2 = Calculator1()
let calculator3 = Calculator2()

calculator1.addDependency(calculator2)
calculator3.addDependency(calculator1)

operationQueue.addOperation(calculator1)
operationQueue.addOperation(calculator2)
operationQueue.addOperation(calculator3)

//operationQueue.addOperation {
//    print("끝")
//}

operationQueue.waitUntilAllOperationsAreFinished()
