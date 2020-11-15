/// Automatic Reference Counting

/// How ARC Works

/// ARC in Action

class Human {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Human?
var reference2: Human?
var reference3: Human?

reference1 = Human(name: "ARC John Appleseed")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
print(reference3!.name)
reference3 = nil
// print: John Appleseed is being deinitialized

/// Strong Reference Cycles between Class Instances

class Person {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Person \(name) is being deinitialized")
    }
}

class Apartment {
    let unit: String
    var tenant: Person?
    
    init(unit: String) {
        self.unit = unit
    }
    
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john?.apartment = unit4A
unit4A?.tenant = john

john = nil
unit4A = nil

//john?.apartment = unit4A

/// Resolving Strong Reference Cycles between Class Instances

/// Weak References

//class Apartment {
//    let unit: String
//    weak var tenant: Person?
//
//    init(unit: String) {
//        self.unit = unit
//    }
//
//    deinit {
//        print("Apartment \(unit) is being deinitialized")
//    }
//}

var grace: Person?
var weakUnit4A: Apartment?

grace = Person(name: "Grace Appleseed")
weakUnit4A = Apartment(unit: "4A")

grace?.apartment = weakUnit4A
weakUnit4A?.tenant = grace

//grace = nil

/// Unowned References

// unowned

func unownedReferences() {
    class Customer {
        let name: String
        var card: CreditCard?
        
        init(name: String) {
            self.name = name
            print("\(name) is being initialized")
        }
        
        deinit {
            print("\(name) is being deinitialized")
        }
    }
    
    class CreditCard {
        let number: UInt64
        unowned let customer: Customer
        
        init(number: UInt64, customer: Customer) {
            self.number = number
            self.customer = customer
            print("Card #\(number) is being initialized")
        }
        
        deinit {
            print("Card #\(number) is being deinitialized")
        }
    }
    
    var john: Customer?
    john = Customer(name: "John Appleseed")
    john?.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)
    
    john = nil
    
    class UnownedUnsafe {
        unowned(unsafe) var name: Customer?
    }
}

/// Unowned Optional References

func unownedOptionalRefereces() {
    class Department {
        var name: String
        var courses: [Course]
        
        init(name: String) {
            self.name = name
            self.courses = []
        }
    }
    
    class Course {
        var name: String
        unowned var department: Department
        unowned var nextCourse: Course?
        
        init(name: String, in department: Department) {
            self.name = name
            self.department = department
        }
    }
    
    let department: Department = Department(name: "Horticulture")
    
    let intro = Course(name: "Survey of Plants", in: department)
    let intermediate = Course(name: "Growing Common Herbs", in: department)
    let advanced = Course(name: "Caring for Tropical Plants", in: department)
    
    intro.nextCourse = intermediate
    intermediate.nextCourse = advanced
    department.courses = [intro, intermediate, advanced]
}

/// Unowned References and Implicitly Unwrapped Optional Properties

func unownedReferencesAndImplicitlyUnwrappedOptionalProperties() {
    class Country {
        let name: String
        var capitalCity: City!
        
        init(name: String, capitalName: String) {
            self.name = name
            self.capitalCity = City(name: capitalName, country: self)
        }
    }
    
    class City {
        let name: String
        unowned let country: Country
        
        init(name: String, country: Country) {
            self.name = name
            self.country = country
        }
    }
    
    let country = Country(name: "Korea", capitalName: "Seoul")
    print("\(country.name)'s capital city is called \(country.capitalCity.name)")
}

unownedReferencesAndImplicitlyUnwrappedOptionalProperties()

/// Strong Reference Cycles for Closures

/// Resolving Strong Reference Cycles for Closures

/// Defining a Capture List

/// Weak and Unowned References
