//
//  main.swift
//  URL Loading System
//
//  Created by Zero DotOne on 2021/01/28.
//

import Foundation

func startLoad() {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else {
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            return
        }
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            return
        }
        if let data = data {
            let decodedData = try! JSONDecoder().decode(Todos.self, from: data)
            print(data)
            print(decodedData)
        }
    }
    task.resume()
}

struct Todos: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

startLoad()
Thread.sleep(forTimeInterval: 5)
