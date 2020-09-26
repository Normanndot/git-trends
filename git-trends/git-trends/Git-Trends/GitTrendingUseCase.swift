//
//  GitTrendingUseCase.swift
//  git-trends
//
//  Created by Norman, ThankaVijay on 26/09/20.
//

import Foundation

protocol TrendingUseCase {
    func fetchTopGitTrending(with completion: @escaping (Result<Repos, Error>) -> Void)
}

final class GitTrendingUseCase: TrendingUseCase {
    
    let apiService: APIServiceInterface
    
    init(apiService: APIServiceInterface) {
        self.apiService = apiService
    }
    
    func fetchTopGitTrending(with completion: @escaping (Result<Repos, Error>) -> Void) {
        let url = Api.trends.baseURL.appendingPathComponent(Api.trends.path)
        let request = Request(url: url,
                              method: .get,
                              parameters: nil,
                              headers: nil,
                              encoding: GetRequestEncoding())
        
        let responseClosure: (Result<APIHTTPDecodableResponse<Repos>, Error>) -> () = { [weak self] result in
            self?.handleResult(result, completion: completion)
        }
        
        guard self.apiService.isReachable else {
            return
        }
        
        self.apiService.request(for: request, completion: responseClosure)
    }
    
    private func handleResult(_ result: Result<APIHTTPDecodableResponse<Repos>, Error>,
                              completion: @escaping (Result<Repos, Error>) -> Void) {
        switch result {
        case .success(let response):
            DispatchQueue.main.async {
                completion(.success(response.decoded))
            }
        case .failure(let error):
            DispatchQueue.main.async {
                completion(.failure(error))
            }
        }
    }
}
