import Foundation

enum A {
    class ConsoleApplication: PlatformInterface {
        var logic: BusinessLogic
        
        func getTime() {
            logic.getCurrentTime()
        }
        
        func updateTime(time: String) {
            print(time)
        }
    }
    
    protocol PlatformInterface {
        func updateTime(time: String)
    }
    
    class BusinessLogic {
        var platform: PlatformInterface
        
        func getCurrentTime() {
            let time = "\(Date())"
            platform.updateTime(time: time)
        }
    }
}

enum B {
    class Repository: PlatformInterface {
        func fetchData(_ callback: @escaping (Data) -> Void) {
            URLSession.shared.dataTask(with: URL()) { (data, _, _) in
                callback(data!)
            }
        }
    }
    
    protocol PlatformInterface {
        func fetchData(_ callback: @escaping (Data) -> Void)
    }
    
    class BusinessLogic {
        var platform: PlatformInterface
        
        func handleData() {
            platform.fetchData { (Data) in
                //
            }
        }
    }
}

enum C {
    class NetworkImpl: Network {
        func GET(url: URL, callback: @escaping (Data) -> Void) {
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                callback(data!)
            }
        }
    }
    
    protocol Network {
        func GET(url: URL, callback: @escaping (Data) -> Void)
    }
    
    class BusinessLogic {
        var platform = Network?
        
        func fetchData(urlString: String) {
            platform.GET(url: URL(string: urlString!) { data in
                //
            }
            }
    }
}
