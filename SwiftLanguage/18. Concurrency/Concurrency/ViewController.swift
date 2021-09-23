import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

//        Process1().process()
        
        Task {
            await Process2().process()
        }
        
//        Task {
//            await process()
//        }
//
//        print("##hello")
    }
    
    func listPhotos(inGallery name: String) async -> [String] {
        await Task.sleep(2 * 1_000_000_000)
        return ["IMG001", "IMG99", "IMG0404"]
    }
    
//    func getData(completion: (Data) -> Void) {
//        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
//        let data = try! Data(contentsOf: url)
//        completion(data)
//    }
//
//    func decode(data: Data, completion: (String) -> Void) {
//        let contents = String(data: data, encoding: .utf8)!
//        completion(contents)
//    }
    
    func getData() async -> Data {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
        let data = try! Data(contentsOf: url)
        return data
    }

    func decode(data: Data) async -> String {
        let contents = String(data: data, encoding: .utf8)!
        return contents
    }

    func process() async {
        let data = await getData()
        let contents = await decode(data: data)
        print(contents)
    }
}

struct Process1 {
    func listPhotos(inGallery name: String, completion: ([String]) -> Void) {
        print(name)
        completion(["IMG001", "IMG002", "IMG003"])
    }
    
    func downloadPhoto(named: String, completion: (String) -> Void) {
        print(named)
        completion("downloadPhoto1")
    }
    
    func process() {
        listPhotos(inGallery: "Summer Vacation") { photoNames in
            let sortedNames = photoNames.sorted()
            let name = sortedNames[1]
            downloadPhoto(named: name) { photo in
                print(photo)
            }
        }
    }
}

struct Process2 {
    func listPhotos(inGallery name: String) async -> [String] {
        await Task.sleep(1 * 1_000_000_000)
        return ["IMG001", "IMG99", "IMG0404"]
    }
    
    func downloadPhoto(named: String) async -> String {
        await Task.sleep(1 * 1_000_000_000)
        return named
    }
    
    func process() async {
        let photoNames = await listPhotos(inGallery: "Summer Vacation")
        let sortedNames = photoNames.sorted()
        let name = sortedNames[1]
        let photo = await downloadPhoto(named: name)
        print(photo)
    }
}
