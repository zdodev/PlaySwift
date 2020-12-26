//
//  NewsFeed.swift
//  news
//
//  Created by zdo on 2020/12/20.
//

import Foundation

struct NewsFeed: Codable {
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Article]?
}
