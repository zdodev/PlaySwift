//
//  File.swift
//  Network-Example
//
//  Created by Zero DotOne on 2021/01/29.
//

import Foundation

typealias HTTPHeaders = [String: String]
typealias Parameters = [String: Any]

enum HTTPTask {
    case request
    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
    case requestParametersAndHeaders(bodyParamters: Parameters?, urlParameters: Parameters?, additionHeaders: HTTPHeaders?)
}
