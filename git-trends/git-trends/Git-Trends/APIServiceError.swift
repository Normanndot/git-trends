//
//  APIServiceError.swift
//  git-trends
//
//  Created by Norman, ThankaVijay on 26/09/20.
//

import Foundation

enum APIServiceError: Error {
    enum URLFormableError: Error {
        case failed
    }
    
    enum CacheableRequestError: Error {
        case invalidMethod
    }
}
