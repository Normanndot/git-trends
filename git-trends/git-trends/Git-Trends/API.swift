//
//  API.swift
//  git-trends
//
//  Created by Norman, ThankaVijay on 26/09/20.
//

import Foundation

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
}

enum Api {
    case trends
}

extension Api: EndpointType {
    var baseURL: URL {
        return URL(string: "https://ghapi.huchen.dev/")!
    }
    
    var path: String {
        switch self {
        case .trends:
            return "repositories"
        }
    }
}
