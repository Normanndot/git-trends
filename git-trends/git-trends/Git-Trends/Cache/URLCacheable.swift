//
//  URLCacheable.swift
//  git-trends
//
//  Created by Norman, ThankaVijay on 26/09/20.
//

import Foundation

typealias URLCacheableStoreCompletion = (Result<Bool, Error>) -> ()

protocol URLCacheable {
    func store<T: Decodable>(response: APIHTTPDecodableResponse<T>, forRequest request: CacheRequestable, completion: URLCacheableStoreCompletion?)
    func get<T: Decodable>(forRequest request: CacheRequestable, completion: @escaping (Result<APIHTTPDecodableResponse<T>?, Error>) -> Void)
}
