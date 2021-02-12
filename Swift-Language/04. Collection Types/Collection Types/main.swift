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

