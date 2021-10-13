import Foundation

struct TestObject {
    func returnTrue() -> Bool {
        true
    }
    
    func returnFalse() -> Bool {
        false
    }
    
    func returnNil() -> Int? {
        nil
    }
    
    func returnNotNil() -> Int? {
        0
    }
    
    func returnOne() -> Int {
        1
    }
    
    func returnOnePointOneTwoThreeFour() -> Double {
        1.1234
    }
    
    func throwError(_ number: Int) throws {
        if number == 1 {
            throw ErrorTest.error
        }
    }
}

class TestClass {
}

enum ErrorTest: Error {
    case error
}

class KVOClass: NSObject {
    @objc dynamic var value = ""
}

final class Article: NSObject {
    @objc var isPublished: Bool
    
    init(isPublished: Bool) {
        self.isPublished = isPublished
    }
}

struct ArticlePublisher {
    func publish(_ article: inout Article) {
        article.isPublished = true
    }
}
