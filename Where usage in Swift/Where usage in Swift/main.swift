enum Action {
    case createUser(age: Int)
    case createPost
    case logout
}

func printAction(action: Action) {
    switch action {
    case .createUser(let age) where age < 21:
        print("Young and wild! \(age)")
    case .createUser:
        print("Older and wise!")
    case .createPost:
        print("Creating a post")
    case .logout:
        print("Logout")
    }
}

printAction(action: .createUser(age: 3))
printAction(action: .createUser(age: 25))
