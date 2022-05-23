import Foundation

let json = """
{
    "Series": {
        "Banana": {
            "points": 200,
            "description": "A banana grown in Ecuador."
        },
        "Orange": {
            "points": 100
        }
    }
}
""".data(using: .utf8)!

struct Series: Decodable {
    let Series: GroceryStore
}

struct GroceryStore {
    struct Product {
        let name: String
        let points: Int
        let description: String?
    }

    var products: [Product]

    init(products: [Product] = []) {
        self.products = products
    }
}


extension GroceryStore: Decodable {
    struct ProductKey: CodingKey {
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        var intValue: Int? { return nil }
        init?(intValue: Int) { return nil }

        static let points = ProductKey(stringValue: "points")!
        static let description = ProductKey(stringValue: "description")!
    }

    init(from decoder: Decoder) throws {
        var products = [Product]()
        let container = try decoder.container(keyedBy: ProductKey.self)
        for key in container.allKeys {
            let productContainer = try container.nestedContainer(keyedBy: ProductKey.self, forKey: key)
            let points = try productContainer.decode(Int.self, forKey: .points)
            let description = try productContainer.decodeIfPresent(String.self, forKey: .description)
            let product = Product(name: key.stringValue, points: points, description: description)
            products.append(product)
        }

        self.init(products: products)
    }
}

let decodedStore = try? JSONDecoder().decode(Series.self, from: json)
print(decodedStore)
