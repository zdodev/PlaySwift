//MARK: - Print Statement
// CustomStringConvertible 프로토콜을 채택하여 description을 구현합니다.
class Ryan: CustomStringConvertible {
    var description: String {
        "Ryan so cute"
    }
}

let ryan = Ryan()

print(ryan)
// Ryan so cute

// CustomDebugStringConvertible 프로토콜을 채택하여 debugDescription을 구현합니다.
extension Ryan: CustomDebugStringConvertible {
    var debugDescription: String {
        "Ryan Debug Description"
    }
}

debugPrint(ryan)
// Ryan Debug Description
dump(ryan)
// - Ryan Debug Description #0

print()

//MARK: - 멋있는 debugDescription
class Ryan1: CustomDebugStringConvertible {
    let cuteLevel = "very cute"
    let pet = "Choonsik"
}

// 프로토콜 기본 구현 사용
extension CustomDebugStringConvertible {
    var debugDescription: String {
        let className = type(of: self)
        let address = "\(Unmanaged.passUnretained(self as AnyObject).toOpaque())"
        var description = "<\(className): \(address), {"
        
        let mirror = Mirror(reflecting: self)
        description += mirror.children.compactMap {
            let (label, value) = $0
            guard let propertyName = label else { return nil }
            return "\(propertyName): \(value)"
        }.joined(separator: ", ")
        
        description += "}>"
        
        return description
    }
}

let ryan1 = Ryan1()

debugPrint(ryan1)
// <Ryan1: 0x000000010813c300, {cuteLevel: very cute, pet: Choonsik}>
