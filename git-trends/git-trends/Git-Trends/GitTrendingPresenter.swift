//
//  GitTrendingPresenter.swift
//  git-trending-app
//
//  Created by Norman, ThankaVijay on 25/09/20.
//

import Foundation

protocol GitTrendingPresenter {
    func startPresenting()
    func stopPresenting()
}

final class GitTrendingViewPresenter: GitTrendingPresenter {
    private let displayer: GitTrendingDisplayer
    private let navigator: GitTrendingNavigator
    private let viewModel: GitTrendingViewModel
    private let factory: GitTrendingViewModelFactory

    init(displayer: GitTrendingDisplayer,
         navigator: GitTrendingNavigator,
         factory: GitTrendingViewModelFactory = GitTrendingViewModelFactory()) {
        self.displayer = displayer
        self.navigator = navigator
        self.factory = factory
        self.viewModel = factory.viewModel()
    }
    
    func startPresenting() {
        displayer.attachListener(listener: newListener())
        displayer.update(with: viewModel)
    }
    
    func stopPresenting() {
        displayer.detachListener()
    }
    
    private func newListener() -> GitTrendingActionlistener {
        return GitTrendingActionlistener(toGitDetailView: toGitDetailView)
    }
    
    private func toGitDetailView() {
        //navigate to git detail view
    }
}
