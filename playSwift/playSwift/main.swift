/// Memory Safety

/// Understanding Conflicting Access to Memory

func understandingConflictingAccessToMemory() {
    let one = 1
    print("We're number \(one)!")
}

/// Characteristics of Memory Access

func characteristicsOfMemoryAccess() {
    func oneMore(than number: Int) -> Int {
        number + 1
    }
    
    var myNumber = 1
    myNumber = oneMore(than: myNumber)
    print(myNumber)
}

/// Conflicting Access to In-Out Parameters

func conflictingAccessToInOutParameters() {
    var stepSize = 1
    
    func increment(_ number: inout Int) {
        number += stepSize
    }
    
//    increment(&stepSize)
    
    var copyOfStepSize = stepSize
    increment(&copyOfStepSize)
    
    stepSize = copyOfStepSize
    
    func balance(_ x: inout Int, _ y: inout Int) {
        let sum = x + y
        x = sum / 2
        y = sum - x
    }
    
    var playerOneScore = 43
    var playerTwoScore = 30
    
    balance(&playerOneScore, &playerTwoScore)
//    balance(&playerOneScore, &playerOneScore)
}

conflictingAccessToInOutParameters()

/// Conflicting Access to self in Methods

/// Conflicting Access to Properties
