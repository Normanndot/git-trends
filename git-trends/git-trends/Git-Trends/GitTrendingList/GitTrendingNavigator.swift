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
    func toGitDetailView()
}

final class GitTrendingViewNavigator: GitTrendingNavigator {
    var navController: UINavigationController?
    
    init(navigation: UINavigationController?) {
        self.navController = navigation
    }
    
    func toGitDetailView() {
        let detail = GitDetailViewController()
        navController?.pushViewController(detail, animated: true)
    }
}
