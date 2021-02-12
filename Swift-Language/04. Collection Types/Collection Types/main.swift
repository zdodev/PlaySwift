/// Collection Types

/// Multability of Collections

/// Arrays

/// Array Type Shorthand Syntax
/*
 struct Array<Element>
 [Element]
 */

/// Creating an Empty Array

var someInts = [Int]()
someInts.append(3)
print("someInts = \(someInts)")
someInts = []
print("someInts = \(someInts)")

/// Creating an Array with a Default Value

var threeDoubles = Array(repeating: 0.0, count: 3)
print("threeDoubles = \(threeDoubles)")

/// Creating an Array by Adding Two Arrays Together

var antoherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + antoherThreeDoubles
print("sixDoubles = \(sixDoubles)")

/// Creating an Array with an Array Literal

var shoppingList: [String] = ["Eggs", "Milk"]
print("shoppingList = \(shoppingList)")
var shoppingList1 = ["Eggs", "Milk"]

/// Accessing and Modifying an Array

print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

shoppingList.append("Flour")
print("shoppingList = \(shoppingList)")

shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
print("shoppingList = \(shoppingList)")

var firstItem = shoppingList[0]
print("firstItem = \(firstItem)")

shoppingList[0] = "Six eggs"
firstItem = shoppingList[0]
print("firstItem = \(firstItem)")

shoppingList[4...6] = ["Bananas", "Apples"]
print("shoppingList = \(shoppingList)")

shoppingList.insert("Maple Syrup", at: 0)
print("shoppingList = \(shoppingList)")

let mapleSyrup = shoppingList.remove(at: 0)
print("mapleSyrup = \(mapleSyrup)")

firstItem = shoppingList[0]
print("firstItem = \(firstItem)")

let apples = shoppingList.removeLast()
print("apples = \(apples)")

/// Iterating Over an Array

for item in shoppingList {
    print("iteraing \(item)...")
}
shoppingList.map {
    print($0)
}

/// Sets

/// Hash Values for Set Types

/// Set Type Syntax
/*
 Set<Element>
 */

/// Creating and Initializing an Empty Set

var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
letters.insert("a")
print("letters = \(letters)")
letters = []
print("letters = \(letters)")

/// Creating a Set wit an Array Literal

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
print("favoriteGenres: \(favoriteGenres)")
var favoriteGenres1: Set = ["Rock", "Classical", "Hip hop"]
print("favoriteGenres1: \(favoriteGenres1)")

/// Accessing and Modifying a Set

print("I have \(favoriteGenres.count) favorite music genres.")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

/// Iterating Over a Set

for genre in favoriteGenres {
    print(genre)
}

for genre in favoriteGenres.sorted() {
    print(genre)
}

/// Performing Set Operations

/// Fundamental Set Operations

let oddDigits: Set<Int> = {
    var set = Set<Int>()
    for odd in stride(from: 1, through: 9, by: 2) {
        set.insert(odd)
    }
    return set
}()

let evenDigits: Set<Int> = {
    var set = Set<Int>()
    for even in stride(from: 0, through: 8, by: 2) {
        set.insert(even)
    }
    return set
}()

let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

let union = oddDigits.union(evenDigits).sorted()
print("union = \(union)")

let intersection = oddDigits.intersection(evenDigits).sorted()
print("intersection = \(intersection)")

let subtracting = oddDigits.subtracting(evenDigits).sorted()
print("subtracting = \(subtracting)")

let symmetricDifference = oddDigits.symmetricDifference(evenDigits).sorted()
print("symmetricDifference = \(symmetricDifference)")

/// Set Membership and Equality

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

let subset = houseAnimals.isSubset(of: farmAnimals)
print("subset = \(subset)")

let superset = farmAnimals.isSuperset(of: houseAnimals)
print("superset = \(superset)")

let disjoint = farmAnimals.isDisjoint(with: cityAnimals)
print("disjoint = \(disjoint)")

/// Dictionaries

/// Dictionary Type Shorhand Syntax
/*
 Dictionary<Key, Value>
 [Key: Value]
 */

/// Creating an Empty Dictionary

var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]
print("namesOfIntegers = \(namesOfIntegers)")

/// Creating a Dictionary with a Dictionary Literal

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print("airports = \(airports)")

var airports1 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print("airpost1 = \(airports1)")

/// Accessing and Modifying a Dictionary

print("The airports dictionary contains \(airports.count) items.")

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}

airports["LHR"] = "London"
print("airports = \(airports)")

airports["LHR"] = "London Heathrow"
print("airports = \(airports)")

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

airports["APL"] = "Apple International"
airports["APL"] = nil
print("airports = \(airports)")

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

/// Iterating Over a Dictionary

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

let airportCode = [String](airports.keys)
print("airportCode = \(airportCode)")

let airportName = [String](airports.values)
print("airportName = \(airportName)")
