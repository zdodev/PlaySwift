import Foundation

protocol NetworkProvider {
    func fetchUserName(userId: String) -> String
}

final class RealNetwork: NetworkProvider {
    func fetchUserName(userId: String) -> String {
        return "RealUser_From_Server"
    }
}

final class UserService {
    private let network: NetworkProvider
    
    init(network: NetworkProvider) {
        self.network = network
    }
    
    func getWelcomeMessage(userId: String) -> String {
        let name = network.fetchUserName(userId: userId)
        return "Hello, \(name)!"
    }
}
