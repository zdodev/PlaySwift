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
