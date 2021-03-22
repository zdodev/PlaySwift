// MARK: Defining and Calling Functions

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(person: "Anna"))
print(greet(person: "Brian"))

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))

// MARK: - Function Parameters and Return Values

// MARK: Functions without Parameters

func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())

// MARK: Functions with Multiple Parameters

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))

// MARK: Functions without return values

func greet1(person: String) {
    print("Hello, \(person)!")
}
greet1(person: "Dave")

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

print(printAndCount(string: "hello, world"))
printWithoutCounting(string: "hello, world")

// MARK: Functions with multiple return values

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

// MARK: Functions with an implicit return

func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}
print(greeting(for: "Dave"))

func anotherGreeting(for person: String) -> String {
    return "Hello, " + person + "!"
}
print(anotherGreeting(for: "Dave"))

// MARK: - Function argument labels and parameter names

func someFunction(firstParameterName: Int, secondParameterName: Int) {
}
someFunction(firstParameterName: 1, secondParameterName: 2)

// MARK: Specifying argument labels

func someFunction(argumentLabel parameterName: Int) {
}

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you colud visit from \(hometown)"
}
print(greet(person: "Bill", from: "Cupertino"))

// MARK: Omitting argument labels

func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
}
someFunction(1, secondParameterName: 2)

// MARK: Default parameter values

func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)
someFunction(parameterWithoutDefault: 4)

// MARK: Variadic Parameters

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print(arithmeticMean(1, 2, 3, 4, 5))
print(arithmeticMean(3, 8.25, 18.75))

// MARK: In-Out Parameters

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 108
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
