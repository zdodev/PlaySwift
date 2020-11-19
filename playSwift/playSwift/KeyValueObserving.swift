import Foundation

class MyObjectToObserve: NSObject {
    @objc dynamic var myDate = NSDate(timeIntervalSince1970: 0)
    
    
    func updateDate() {
        myDate = myDate.addingTimeInterval(Double(2 << 30))
    }
}

class MyObserver: NSObject {
    @objc var objectToObserve: MyObjectToObserve
    var observation: NSKeyValueObservation?
     
    init(object: MyObjectToObserve) {
        objectToObserve = object
        super.init()
        
        observation = observe(\.objectToObserve.myDate, options: [.old, .new]) {
            object, change in
            print("myDate changed from: \(change.oldValue!), update to: \(change.newValue!)")
        }
    }
}

let observed = MyObjectToObserve()
let observer = MyObserver(object: observed)

observed.updateDate()

class Children: NSObject {
    @objc dynamic var name: String!
    @objc dynamic var age: Int
    
    @objc dynamic var child: Children?
    
    override init() {
        name = ""
        age = 0
        super.init()
    }
}

class Kvo: NSObject {
    var child1: Children!
    var child2: Children!
    var child3: Children!
    
    var child1Context = UnsafeMutableRawPointer.allocate(byteCount: 4 * 4, alignment: 1)
    var child2COntext = UnsafeMutableRawPointer.allocate(byteCount: 4 * 4, alignment: 2)
    

    override init() {
        child1 = Children()
        child1.name = "LEELA KRISHNA"
        child1.age = 28

        child2 = Children.init()
        child2.child = Children.init()
        child2.setValue("Sarah", forKey: "name")
        child2.setValue(25, forKey: "age")
        child2.setValue("Sansa", forKeyPath: "child.name")
        child2.setValue(5, forKeyPath: "child.age")

        child3 = Children.init()
        child3.child = Children.init()
        child3.child?.child = Children.init()

        child3.setValue("Mark", forKeyPath: "child.child.name")
        child3.setValue("20", forKeyPath: "child.child.age")
        
        super.init()
    }


    func viewWillAppear() {
        child1.addObserver(self, forKeyPath: "name", options: [.new, .old], context: child1Context)
        child1.addObserver(self, forKeyPath: "age", options: [.new, .old], context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        /*
        if keyPath == "name" {
            print("child1 Name is changed")
            print(change![NSKeyValueChangeKey.newKey] as! String)
            print(change![NSKeyValueChangeKey.oldKey] as! String)
        }
        
        if keyPath == "age" {
            print("child 1 Age is changed")
            print(change![NSKeyValueChangeKey.newKey] as! Int)
            print(change![NSKeyValueChangeKey.oldKey] as! Int)
        }
         */
        
        if context == child1Context {
            if keyPath == "name" {
                print("child 1 name is changed")
                print(change![NSKeyValueChangeKey.newKey] as! String)
                print(change![NSKeyValueChangeKey.oldKey] as! String)
            }
        } else if context == child2COntext {
            if keyPath == "name" {
                print("child 2 name is changed")
                print(change![NSKeyValueChangeKey.newKey] as! String)
                print(change![NSKeyValueChangeKey.oldKey] as! String)
            }
            child2.removeObserver(self, forKeyPath: "age", context: child2COntext)
        } else {
            print("Contenxt error")
        }
    }
    
    func func1() {
        child2.addObserver(self, forKeyPath: "name", options: [.new, .old], context: nil)
//        child2.setValue(23, forKey: "age")
    }
}

let kvo = Kvo()
kvo.viewWillAppear()
kvo.child1.name = "ee"
kvo.child1.age = 25
kvo.func1()
//kvo.child2.setValue("drakedog", forKey: "name")

//https://hackernoon.com/kvo-kvc-in-swift-12f77300c387
//https://medium.com/@Alpaca_iOSStudy/delegation-notification-그리고-kvo-82de909bd29
