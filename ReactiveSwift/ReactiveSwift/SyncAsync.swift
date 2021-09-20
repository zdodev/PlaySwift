import Foundation

class SyncAsync {
    var counter = 0
    
    let largestImageURL = "https://picsum.photos/2560/1440/?random"
    
    func viewDidLoad() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] _ in
            counter += 1
            print(counter)
        }
    }
    
    func onLoadSync() {
        guard let url = URL(string: largestImageURL) else {
            return
        }
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        
        print("download image: \(data)")
    }
    
    func onLoadAsync() {
        DispatchQueue.global().async {
            guard let url = URL(string: self.largestImageURL) else {
                return
            }
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            
            print("download image: \(data)")
        }
    }
}
