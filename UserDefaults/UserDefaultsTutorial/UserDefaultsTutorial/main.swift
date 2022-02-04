import Foundation

@propertyWrapper
struct Storage<T: Codable> {
    private let key: String
    private let defaultValue: T
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            guard let data = UserDefaults.standard.object(forKey: key) as? Data else {
                return defaultValue
            }
            
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}

struct AppData {
    @Storage(key: "username_key", defaultValue: "")
    static var username: String
    
    @Storage(key: "enable_auto_login_key", defaultValue: false)
    static var enableAutoLogin: Bool
    
    @Storage(key: "user_key", defaultValue: User(firstName: "", lastName: "", lastLogin: nil))
    static var user: User
    
    private static let keys = ["username_key", "enable_auto_login_key", "user_key"]
    
    static func removeAll() {
        keys.forEach { key in
            UserDefaults.standard.removeObject(forKey: key)
        }
    }
}

struct User: Codable {
    var firstName: String
    var lastName: String
    var lastLogin: Date?
}

AppData.removeAll()

AppData.username = "Swift"
print(AppData.username)

AppData.enableAutoLogin = true
print(AppData.enableAutoLogin)

let johnWick = User(firstName: "John", lastName: "Wick", lastLogin: Date())
AppData.user = johnWick
print(AppData.user)
