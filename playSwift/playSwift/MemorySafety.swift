///// Memory Safety
//
///// Understanding Conflicting Access to Memory
//
//func understandingConflictingAccessToMemory() {
//    let one = 1
//    print("We're number \(one)!")
//}
//
///// Characteristics of Memory Access
//
//func characteristicsOfMemoryAccess() {
//    func oneMore(than number: Int) -> Int {
//        number + 1
//    }
//    
//    var myNumber = 1
//    myNumber = oneMore(than: myNumber)
//    print(myNumber)
//}
//
///// Conflicting Access to In-Out Parameters
//
//func conflictingAccessToInOutParameters() {
//    var stepSize = 1
//    
//    func increment(_ number: inout Int) {
//        number += stepSize
//    }
//    
////    increment(&stepSize)
//    
//    var copyOfStepSize = stepSize
//    increment(&copyOfStepSize)
//    
//    stepSize = copyOfStepSize
//    
//    func balance(_ x: inout Int, _ y: inout Int) {
//        let sum = x + y
//        x = sum / 2
//        y = sum - x
//    }
//    
//    var playerOneScore = 43
//    var playerTwoScore = 30
//    
//    balance(&playerOneScore, &playerTwoScore)
////    balance(&playerOneScore, &playerOneScore)
//}
//
///// Conflicting Access to self in Methods
//
//func conflictingAccessToSelfInMethods() {
//    struct Player {
//        var name: String
//        var health: Int
//        var energy: Int
//        
//        static let maxHealth = 10
//        
//        mutating func restoreHealth() {
//            health = Player.maxHealth
//        }
//        
//        func balance(_ x: inout Int, _ y: inout Int) {
//            let sum = x + y
//            x = sum / 2
//            y = sum - x
//        }
//        
//        mutating func shareHealth(with teammate: inout Player) {
//            balance(&teammate.health, &health)
//        }
//    }
//    
//    var oscar = Player(name: "Oscar", health: 10, energy: 10)
//    var maria = Player(name: "Maria", health: 5, energy: 10)
//    oscar.shareHealth(with: &maria)
//    
//    // Error
////    oscar.shareHealth(with: &oscar)
//}
//
///// Conflicting Access to Properties
//
//func conflictingAccessToProperties() {
//    func balance(_ x: inout Int, _ y: inout Int) {
//        let sum = x + y
//        x = sum / 2
//        y = sum - x
//    }
//
//    var playerInformation = (health: 10, energy: 20)
//    // 에러가 출력되야 합니다..
//    balance(&playerInformation.health, &playerInformation.energy)
//
//    struct Player {
//        var name: String
//        var health: Int
//        var energy: Int
//    }
//
//    var holly = Player(name: "Holly", health: 10, energy: 10)
//    // 에러가 출력되야 합니다..
//    balance(&holly.health, &holly.energy)
//    
//    func someFunction() {
//        var oscar = Player(name: "Oscar", health: 10, energy: 10)
//        balance(&oscar.health, &oscar.energy)
//    }
//}
