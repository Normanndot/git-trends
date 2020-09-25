//
//  GitTrendingCellFactory.swift
//  git-trending-app
//
//  Created by Norman, ThankaVijay on 25/09/20.
//

import Foundation
import UIKit

final class GitTrendingCellFactory {
    
    static private let resueableCellID = "GitTrendingRowCellID"

    static func registerCells(for tableView: UITableView) {
        tableView.register(GitTrendingRowCell.self, forCellReuseIdentifier: GitTrendingCellFactory.resueableCellID)
    }
    
    func cell(for viewModel: GitTrendingRow,
              at indexPath: IndexPath,
              in tableView: UITableView,
              using actionListener: GitTrendingActionlistener?) -> UITableViewCell {
        switch viewModel {
        case .gitTrendingDetails(let viewRowModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: GitTrendingCellFactory.resueableCellID, for: indexPath) as! GitTrendingRowCell
            cell.configureCell(item: viewRowModel)
            return cell
        }
    }
}
