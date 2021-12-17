import Foundation

struct Defaults {
    private let testDefaults = UserDefaults(suiteName: "test")!
    
    enum Keys: String, CaseIterable {
        case value1 = "value1"
        case value2 = "value2"
        case value3 = "value3"
        case value4 = "value4"
    }
    
    func set(value: Any, for key: Keys) {
        testDefaults.set(value, forKey: key.rawValue)
    }
    
    func integer(for key: Keys) -> Int {
        testDefaults.integer(forKey: key.rawValue)
    }
    
    func double(for key: Keys) -> Double {
        testDefaults.double(forKey: key.rawValue)
    }
    
    func string(for key: Keys) -> String {
        testDefaults.string(forKey: key.rawValue) ?? ""
    }
    
    func bool(for key: Keys) -> Bool {
        testDefaults.bool(forKey: key.rawValue)
    }
    
    func removeValue(for key: Keys) {
        testDefaults.removeObject(forKey: key.rawValue)
    }
    
    func removeAllValues() {
        Keys.allCases.forEach { key in
            testDefaults.removeObject(forKey: key.rawValue)
        }
    }
}

let defaults = Defaults()

defaults.set(value: 1, for: .value1)
let integerValue = defaults.integer(for: .value1)
print(integerValue)

defaults.set(value: "abcd", for: .value2)
let stringValue = defaults.string(for: .value2)
print(stringValue)

defaults.set(value: 1.1, for: .value3)
let doubleValue = defaults.double(for: .value3)
print(doubleValue)

defaults.set(value: true, for: .value4)
let boolValue = defaults.bool(for: .value4)
print(boolValue)

RunLoop.main.run()

