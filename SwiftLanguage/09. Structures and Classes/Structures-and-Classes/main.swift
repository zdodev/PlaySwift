// MARK: - Structures and Classes

// MARK: Comparing Structures and Classes

// MARK: Definition Syntax

struct SomeStructure {
    
}

class SomeClass {
    
}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// MARK: Structure and Class Instances

let someResolution = Resolution()
let someVideoMode = VideoMode()

// MARK: Accessing Properties

print("The width of someResolution is \(someResolution.width)")
print("The width of someVedieMode is \(someVideoMode.resolution.width)")
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

// MARK: Memberwise Initializers for Structure Types

let vga = Resolution(width: 640, height: 480)
print("vga = \(vga.width), \(vga.height)")

// MARK: - Structures and Enumerations are Value Types

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

enum CompassPoint {
    case north, south, east, west
    
    mutating func turnNorth() {
        self = .north
    }
}

var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")

// MARK: - Classes are Reference Types

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

// MARK: Identity Operators

if tenEighty === alsoTenEighty {
  print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// tenEighty and alsoTenEighty refer to the same VideoMode instance.

// MARK: Pointers
