//
//  GitTrendingView.swift
//  git-trending-app
//
//  Created by Norman, ThankaVijay on 25/09/20.
//

import Foundation
import UIKit

protocol GitTrendingDisplayer: class {
    func attachListener(listener: GitTrendingActionlistener)
    func detachListener()
    func update(with viewModel: GitTrendingViewModel)
}

final class GitTrendingView: UIView {
    private let tableView: UITableView
    private let adapter = GitTrendingAdapter()

    override init(frame: CGRect) {
        tableView = UITableView(frame: frame, style: .plain)
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        backgroundColor = .clear
        setupTableView()
        applyConstraints()
    }

    func setupTableView() {
        addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.delegate = adapter
        tableView.dataSource = adapter
        tableView.separatorStyle = .none
        GitTrendingCellFactory.registerCells(for: tableView)
    }
    
    func applyConstraints() {
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
}

extension GitTrendingView: GitTrendingDisplayer {
    func attachListener(listener: GitTrendingActionlistener) {
        adapter.attachListener(listener: listener)
    }
    
    func update(with viewModel: GitTrendingViewModel) {
        adapter.update(tableView: tableView, viewModel: viewModel)
    }
    
    func detachListener() {
        adapter.detachListener()
    }
}
