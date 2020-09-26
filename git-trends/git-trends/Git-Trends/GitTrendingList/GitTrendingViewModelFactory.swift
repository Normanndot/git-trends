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
            let viewModel = GitTrendingRowViewModel(author: $0.author,
                                                    authorIcon: $0.avatar,
                                                    authorName: $0.builtBy[0].username,
                                                    description: $0.description,
                                                    starCount: "\($0.stars)",
                                                    forkCount: "\($0.forks)",
                                                    repoURL: $0.url)
            return GitTrendingRow.gitTrendingDetails(viewModel: viewModel)
        })
    }
}
