//
//  URLFormable.swift
//  git-trends
//
//  Created by Norman, ThankaVijay on 26/09/20.
//

import Foundation

protocol URLFormable {
    func asURL() throws -> URL
}

extension String: URLFormable {
    
    func asURL() throws -> URL {
        guard let url = URL(string: self) else {
            throw APIServiceError.URLFormableError.failed
        }
        return url
    }
}

extension URL: URLFormable {
    
    func asURL() throws -> URL {
        return self
    }
}
