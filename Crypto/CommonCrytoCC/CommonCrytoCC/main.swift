import Foundation
import CommonCrypto

struct Cryptography {
    enum Operation {
        case encrypt
        case decrypt
        
        var operation: CCOperation {
            switch self {
            case .encrypt:
                return CCOperation(kCCEncrypt)
            case .decrypt:
                return CCOperation(kCCDecrypt)
            }
        }
    }
    
    private let key: Data
    private let ivData: Data
    private let operation: CCOperation
    
    init(key: String, iv: String, operation: Operation) {
        self.key = key.data(using: .utf8)!
        self.ivData = iv.data(using: .utf8)!
        self.operation = operation.operation
    }
    
    func crypt(data: Data) -> Data? {
        let cryptLength = size_t(data.count + kCCBlockSizeAES128)
        var cryptData = Data(count: cryptLength)
        
        let keyLength = size_t(kCCKeySizeAES128)
        let options = CCOptions(kCCOptionPKCS7Padding)
        
        var numBytesEncrypted: size_t = 0
        let cryptStatus = cryptData.withUnsafeMutableBytes { cryptBytes in
            data.withUnsafeBytes { dataBytes in
                ivData.withUnsafeBytes { ivBytes in
                    key.withUnsafeBytes { keyBytes in
                        CCCrypt(
                            operation,
                            CCAlgorithm(kCCAlgorithmAES),
                            options,
                            keyBytes.baseAddress,
                            keyLength,
                            ivBytes.baseAddress,
                            dataBytes.baseAddress,
                            data.count,
                            cryptBytes.baseAddress,
                            cryptLength,
                            &numBytesEncrypted
                        )
                    }
                }
            }
        }
        
        if UInt32(cryptStatus) == UInt32(kCCSuccess) {
            cryptData.removeSubrange(numBytesEncrypted..<cryptData.count)
        } else {
            print("Error: \(cryptStatus)")
        }
        
        return cryptData
    }
}

let encryter = Cryptography(key: "qw", iv: "ivasdfqwer", operation: .encrypt)
let encrytedData = encryter.crypt(data: "asdfqwerasdfqwer".data(using: .utf8)!)!

let decryter = Cryptography(key: "qw", iv: "ivasdfqwer", operation: .decrypt)
let decrytedData = decryter.crypt(data: encrytedData)!
print(String(data: decrytedData, encoding: .utf8)!)

func unsafeRawPointer(from data: Data) -> UnsafeRawPointer? {
    let buffer = data.withUnsafeBytes { $0 }
    return buffer.baseAddress
}

func unsafeMutableRawPointer(from data: inout Data) -> UnsafeMutableRawPointer? {
    let buffer = data.withUnsafeMutableBytes { $0 }
    return buffer.baseAddress
}
