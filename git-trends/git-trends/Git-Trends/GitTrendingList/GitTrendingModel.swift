//
//  GitTrendingModel.swift
//  git-trending-app
//
//  Created by Norman, ThankaVijay on 25/09/20.
//

import Foundation

// MARK: - TrendingRepos
struct TrendingRepos: Decodable {
    let author, name: String
    let avatar: String
    let url: String
    let description: String
    let language, languageColor: String?
    let stars, forks, currentPeriodStars: Int
    let builtBy: [BuiltBy]
}

// MARK: - BuiltBy
struct BuiltBy: Decodable {
    let href, avatar: String
    let username: String
}

typealias Repos = [TrendingRepos]
