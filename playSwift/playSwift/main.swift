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

/// Conflicting Access to self in Methods

/// Conflicting Access to Properties
