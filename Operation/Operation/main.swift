//
//  main.swift
//  Operation
//
//  Created by Zero DotOne on 2021/01/15.
//

import Foundation

class Calculator: Operation {
    var a = 0
    
    /// non-concurrent task
    override func main() {
        for index in 1...5 {
            print("\(index)...🌸")
        }
        a += 1
        print(a)
    }
}
let opq = OperationQueue()
let a = Calculator()
opq.addOperation(a)
opq.waitUntilAllOperationsAreFinished()


//var balance = 1200

struct ATM {
    var balance = 1200
    
    let tag: String
    mutating func withdraw(value: Int) {
        print("\(self.tag): checking if balance containing sufficent money")
        if balance > value {
            print("\(self.tag): Balance is sufficent, please wait while processing withdrawal")
            // sleeping for some random time, simulating a long process
            Thread.sleep(forTimeInterval: Double.random(in: 0...2))
            balance -= value
            print("\(self.tag): Done: \(value) has been withdrawed")
            print("\(self.tag): current balance is \(balance)")
        } else {
            print("\(self.tag): Can't withdraw: insufficent balance")
        }
    }
}

let queue = DispatchQueue(label: "WithdrawalQueue", attributes: .concurrent)

queue.async {
    var firstATM = ATM(tag: "firstATM")
    firstATM.withdraw(value: 1000)
}

queue.async {
    var secondATM = ATM(tag: "secondATM")
    secondATM.withdraw(value: 800)
}
Thread.sleep(forTimeInterval: 5)
//print()


