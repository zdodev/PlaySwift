//
//  Article.swift
//  news
//
//  Created by zdo on 2020/12/20.
//

import Foundation

struct Article: Codable {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}
