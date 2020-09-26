//
//  Requestable.swift
//  git-trends
//
//  Created by Norman, ThankaVijay on 26/09/20.
//

import Foundation

typealias RequestParameters = [String: Any]
typealias RequestHeaders = [String: String]

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}


protocol Requestable {
    func asURLRequest() throws -> URLRequest
}

extension URLRequest: Requestable {
    
    func asURLRequest() throws -> URLRequest {
        return self
    }
}

