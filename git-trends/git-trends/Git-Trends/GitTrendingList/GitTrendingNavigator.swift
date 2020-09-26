//
//  GitTrendingNavigator.swift
//  git-trending-app
//
//  Created by Norman, ThankaVijay on 25/09/20.
//

import Foundation
import UIKit

protocol GitTrendingNavigator: class {
    var navController: UINavigationController? { get }
    func toGitDetailView(model: GitTrendingRow)
}

final class GitTrendingViewNavigator: GitTrendingNavigator {
    var navController: UINavigationController?
    
    init(navigation: UINavigationController?) {
        self.navController = navigation
    }
    
    func toGitDetailView(model: GitTrendingRow) {
        switch model {
        case .gitTrendingDetails(let detailModel):
            let detail = GitDetailViewController(viewModel: detailModel)
            navController?.pushViewController(detail, animated: true)
        }
    }
}
