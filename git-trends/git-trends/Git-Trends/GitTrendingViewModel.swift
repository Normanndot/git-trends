//
//  GitTrendingViewModel.swift
//  git-trending-app
//
//  Created by Norman, ThankaVijay on 25/09/20.
//

import Foundation
import UIKit

struct GitTrendingViewModel {
    var rows: [GitTrendingRow]
}

struct GitTrendingRowViewModel {
    let name: String
    let starCount: String
    let description: String
    let imageIcon = TrendingIcon.favorite.image
}

enum TrendingIcon: String {
    case favorite
    
    var image: UIImage {
        switch self {
        case .favorite: return UIImage(named: "favourite")!
        }
    }
}

enum GitTrendingRow: Equatable {
    case gitTrendingDetails(viewModel: GitTrendingRowViewModel)

    static func == (lhs: GitTrendingRow, rhs: GitTrendingRow) -> Bool {
        switch (lhs, rhs) {
        case (.gitTrendingDetails(let a), .gitTrendingDetails(let b)):
            return a.name == b.name
        }
    }
}
