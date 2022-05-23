import Foundation

// JSON 데이터
let json = """
[
    {
        "name": "Banana",
        "points": 200,
        "description": "A banana grown in Ecuador."
    },
    {
        "name": "Orange",
        "points": 100
    }
]
""".data(using: .utf8)!

// 모델
struct GroceryProduct: Codable {
    var name: String
    var points: Int
    var description: String?
}

struct First {
    private let decoder = JSONDecoder()

    // 디코딩
    func decodeJSON() {
        let products = try? decoder.decode([GroceryProduct].self, from: json)
        print("The following products available:")
        for product in products! {
            print("\t\(product.name) (\(product.points) points")
            if let description = product.description {
                print("\t\t\(description)")
            }
        }
    }
}

let decoder = JSONDecoder()
