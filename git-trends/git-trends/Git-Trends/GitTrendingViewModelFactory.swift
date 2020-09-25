//
//  GitTrendingViewModelFactory.swift
//  git-trending-app
//
//  Created by Norman, ThankaVijay on 25/09/20.
//

import Foundation

final class GitTrendingViewModelFactory {
    func viewModel() -> GitTrendingViewModel {
        return GitTrendingViewModel(rows: [GitTrendingRow.gitTrendingDetails(viewModel: GitTrendingRowViewModel(name: "bootstrap", starCount: "14423", description: "askdfjha asdfjhaldks jfahsdkf alshdfj alksdjfh aklsdfj alsfh alksdf "))])
    }
}
