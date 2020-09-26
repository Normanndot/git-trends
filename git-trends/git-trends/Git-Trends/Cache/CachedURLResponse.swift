//
//  CachedURLResponse.swift
//  git-trends
//
//  Created by Norman, ThankaVijay on 26/09/20.
//

import Foundation

extension CachedURLResponse {
    
    func decoded<T: Decodable>(with decodableType: T.Type) throws -> T {
        try JSONDecoder().decode(T.self, from: self.data) as T
    }
}
