/// Hatching the Egg

protocol Bird: CustomStringConvertible {
    var name: String { get }
//    var canFly: Bool { get }
}

/// Extending Protocols With Default Implementations

extension Bird {
    var canFly: Bool {
        self is Flyable
    }
}

/// Extending Protocols

extension CustomStringConvertible where Self: Bird {
    var description: String {
        canFly ? "I canfly" : "Guess I'll just sit here :["
    }
}

protocol Flyable {
    var airspeedVelocity: Double { get }
}

/// Defining Protocol-Conforming Types

struct FlappyBird: Bird, Flyable {
    let name: String
//    let canFly = true
    let flappyAmplitude: Double
    let flappyFrequency: Double
    
    var airspeedVelocity: Double {
        3 * flappyFrequency * flappyAmplitude
    }
}

struct Penguin: Bird {
    let name: String
//    let canFly = false
}

struct SwiftBird: Bird, Flyable {
    var name: String {
        "Swift \(version)"
    }
//    let canFly = true
    let version: Double
    private var speedFactor = 1000.0
    
    init(version: Double) {
        self.version = version
    }
    
    var airspeedVelocity: Double {
        version * speedFactor
    }
}

/// Enums Can Play, Too

enum UnladenSwallow: Bird, Flyable {
    case african
    case european
    case unknown
    
    var name: String {
        switch self {
        case .african:
            return "African"
        case .european:
            return "European"
        case .unknown:
            return "What do you mean? African or European?"
        }
    }
    
    var airspeedVelocity: Double {
        switch self {
        case .african:
            return 10.0
        case .european:
            return 9.9
        case .unknown:
            fatalError("You are thrown from the bridge of death!")
        }
    }
}


/// Overriding Default Behavior

extension UnladenSwallow {
    var canFly: Bool {
        self != .unknown
    }
}

print(UnladenSwallow.unknown.canFly)
print(UnladenSwallow.african.canFly)
print(UnladenSwallow.african)

/// Effects on the Swift Standard Library

let numbers = [10, 20, 30, 40, 50, 60]
let slice = numbers[1...3]
let reversedSlice = slice.reversed()
let answer = reversedSlice.map {
    $0 * 10
}
print(answer)

/// Off to the Races

class Motorcycle {
    var name: String
    var speed: Double
    
    init(name: String) {
        self.name = name
        speed = 200.0
    }
}

/// Bringing It All Together

protocol Racer {
    // speed is the only thing racers care about
    var speed: Double { get }
}

extension FlappyBird: Racer {
    var speed: Double {
        airspeedVelocity
    }
}

extension SwiftBird: Racer {
    var speed: Double {
        airspeedVelocity
    }
}

extension Penguin: Racer {
    var speed: Double {
        42
    }
}

extension UnladenSwallow: Racer {
    var speed: Double {
        canFly ? airspeedVelocity : 0.0
    }
}

extension Motorcycle: Racer {}

let racers: [Racer] = [
    UnladenSwallow.african,
    UnladenSwallow.european,
    UnladenSwallow.unknown,
    Penguin(name: "King Penguin"),
    SwiftBird(version: 5.1),
    FlappyBird(name: "Felipe", flappyAmplitude: 3.0, flappyFrequency: 20.0),
    Motorcycle(name: "Giacomo")
]

/// Top Speed

//func topSpeed<RecersType: Sequence>(of racers: RecersType) -> Double where RecersType.Iterator.Element == Racer {
//    racers.max {
//        $0.speed < $1.speed
//    }?.speed ?? 0.0
//}
//print(topSpeed(of: racers[1...3]))

/// Making It Move Generic

/// Making It More Swifty

extension Sequence where Iterator.Element == Racer {
    func topSpeed() -> Double {
        self.max {
            $0.speed < $1.speed
        }?.speed ?? 0.0
    }
}

print(racers.topSpeed())
print(racers[1...3].topSpeed())

/// Protocol Comparators

protocol Score: Comparable {
    var value: Int { get }
}

struct RacingScore: Score {
    let value: Int
    
    static func < (lhs: RacingScore, rhs: RacingScore) -> Bool {
        lhs.value < lhs.value
    }
}

print(RacingScore(value: 150) >= RacingScore(value: 130))

/// Mutating Functions

protocol Cheat {
    mutating func boost(_ power: Double)
}

extension SwiftBird: Cheat {
    mutating func boost(_ power: Double) {
        speedFactor += power
    }
}

var swiftBird = SwiftBird(version: 5.0)
swiftBird.boost(3.0)
print(swiftBird.airspeedVelocity)
swiftBird.boost(3.0)
print(swiftBird.airspeedVelocity)
