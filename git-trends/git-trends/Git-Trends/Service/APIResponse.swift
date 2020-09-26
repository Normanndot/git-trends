//
//  APIResponse.swift
//  git-trends
//
//  Created by Norman, ThankaVijay on 26/09/20.
//

import Foundation

struct APIHTTPDataResponse {
    let data: Data
    let httpResponse: HTTPURLResponse?
}

struct APIHTTPDecodableResponse<T> where T:Decodable {
    let data: Data
    let decoded: T
    let httpResponse: HTTPURLResponse?
}
