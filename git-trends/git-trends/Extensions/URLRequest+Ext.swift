//
//  URLRequest+Addition.swift
//  git-trends
//
//  Created by Norman, ThankaVijay on 26/09/20.
//

import Foundation

extension URLRequest {
    init(with url: URLFormable, method: RequestMethod, headers: [String: String]?) throws {
        self.init(url: try url.asURL())
        self.httpMethod = method.rawValue
        self.allHTTPHeaderFields = headers
    }
}
