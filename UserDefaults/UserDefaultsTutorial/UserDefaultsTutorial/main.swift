import Foundation

struct Defaults {
    private let testDefaults = UserDefaults(suiteName: "test")!
    
    enum KeyBundle<T> {
        case value1(T)
        
        var key: String {
            switch self {
            case .value1(_):
                return "value1"
            }
        }
    }
    
    enum Keys: String {
        case key1 = "key1"
        case key2 = "key2"
    }
    
//    struct Keys<T> {
//        let isVCissued = Key<Double>.key1(<#T##Double#>)
//    }
    
    func get() {
    }
    
    func set<T>(value: T, for keyBundle: String) {
        testDefaults.set(value, forKey: keyBundle)
    }
    
//    func object<T>(for key: KeyBundle<T>) -> T {
//        testDefaults.object(forKey: key.key)
//    }
    
//    func removeValue(for key: Keys) {
//        testDefaults.removeObject(forKey: key.rawValue)
//    }
//
//    func removeAllValues() {
//        Keys.allCases.forEach { key in
//            testDefaults.removeObject(forKey: key.rawValue)
//        }
//    }
}

let defaults = Defaults()
defaults.set(value: 1, for: "key1")


RunLoop.main.run()

