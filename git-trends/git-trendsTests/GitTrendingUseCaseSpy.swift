//
//  GitTrendingUseCaseSpy.swift
//  gitTrendsTests
//
//  Created by Norman, ThankaVijay on 28/09/20.
//

import Foundation
@testable import gitTrends

final class GitTrendingUseCaseSpy: TrendingUseCase {
    
    func fetchTopGitTrending(with completion: @escaping (Result<Repos, Error>) -> Void, forcely: Bool) {
        if let repos = Utils.readJSONFromFile(fileName: "sample", type: Repos.self) {
            DispatchQueue.main.async {
                completion(.success(repos))
            }
        } else {
//            let error = Error.self
            DispatchQueue.main.async {
//                completion(.failure(error))
            }
        }
    }
}
