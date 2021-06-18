// MARK: - Properties

// MARK: - Stored Properties

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

// MARK: Stored Properties of Constant Structure Instances

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems = 6

// MARK: Lazy Stored Properties

class DataImpoter {
    var filename = "data.txt"
}

class DataManager {
    lazy var importer = DataImpoter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

print(manager.importer.filename)

// MARK: Stored Properties and Instance Variables

// MARK: - Computed Properties

// MARK: Shorthand Setter Declaration

// MARK: Shorthand Getter Declaration

// MARK: Read-Only Computed Properties

// MARK: - Property Observers

// MARK: - Property Wrappers

// MARK: Setting Initial Values for Wrapped Properties

// MARK: Projecting a Value from a Property Wrapper

// MARK: - Global and Local Variables

// MARK: - Type Properties

// MARK: Type Property Syntax

// MARK: Querying and Setting Type Properties
