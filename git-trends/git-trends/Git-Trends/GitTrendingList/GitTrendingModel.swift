//
//  GitTrendingModel.swift
//  git-trending-app
//
//  Created by Norman, ThankaVijay on 25/09/20.
//

import Foundation

// MARK: - TrendingRepos
struct TrendingRepos: Codable {
    let author, name: String
    let avatar: String
    let url: String
    let description, language, languageColor: String
    let stars, forks, currentPeriodStars: Int
    let builtBy: [BuiltBy]
}

// MARK: - BuiltBy
struct BuiltBy: Codable {
    let href, avatar: String
    let username: String
}

typealias Repos = [TrendingRepos]
