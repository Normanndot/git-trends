//
//  RequestEncoding.swift
//  git-trends
//
//  Created by Norman, ThankaVijay on 26/09/20.
//

import Foundation
import Alamofire

protocol RequestEncoding {
    func encode(_ request: URLRequest, with parameters: RequestParameters) throws -> URLRequest
}

struct GetRequestEncoding: RequestEncoding {
    
    func encode(_ request: URLRequest, with parameters: RequestParameters) throws -> URLRequest {
        return try URLEncoding().encode(request, with: parameters)
    }
}

struct PostRequestEncoding: RequestEncoding {
    
    func encode(_ request: URLRequest, with parameters: RequestParameters) throws -> URLRequest {
        return try JSONEncoding().encode(request, with: parameters)
    }
}
