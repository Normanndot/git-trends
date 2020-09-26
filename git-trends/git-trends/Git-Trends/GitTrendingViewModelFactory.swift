//
//  GitTrendingViewModelFactory.swift
//  git-trending-app
//
//  Created by Norman, ThankaVijay on 25/09/20.
//

import Foundation

final class GitTrendingViewModelFactory {
    func viewModel(for trendingRepos: Repos) -> GitTrendingViewModel {
        return GitTrendingViewModel(rows: trendingRepos.map {
            let viewModel = GitTrendingRowViewModel(name: $0.name, starCount: "\($0.stars)", description: $0.description)
            return GitTrendingRow.gitTrendingDetails(viewModel: viewModel)
        })
    }
}
