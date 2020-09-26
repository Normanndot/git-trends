//
//  APIServiceInterface.swift
//  git-trends
//
//  Created by Norman, ThankaVijay on 26/09/20.
//

import Foundation

protocol APIServiceInterface {
    var isReachable: Bool { get }
    func request<T: Decodable>(for request: Requestable, completion: @escaping (Result<APIHTTPDecodableResponse<T>, Error>) -> Void)
    func dataRequest(for request: Requestable, completion: @escaping (Result<APIHTTPDataResponse, Error>) -> Void)
}
