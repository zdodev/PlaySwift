//
//  ViewController.swift
//  news
//
//  Created by zdo on 2020/12/20.
//
// API Key: c370a1736b3b47c68687737e5986b541
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hit the API  endpoint
        let urlString = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=c370a1736b3b47c68687737e5986b541"
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            // Check for errors
            if error == nil && data != nil {
                // Parse JSON
                let decoder = JSONDecoder()
                
                do {
                    let newsFeed = try decoder.decode(NewsFeed.self, from: data!)
                    for i in newsFeed.articles! {
                        print(i)
                    }
                } catch {
                    print("Error in JSON parsing")
                }
            }
        }
        
        dataTask.resume()
    }
}

