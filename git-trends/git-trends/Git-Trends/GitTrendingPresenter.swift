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
    private let factory: GitTrendingViewModelFactory
    private let useCase: TrendingUseCase
    
    init(displayer: GitTrendingDisplayer,
         navigator: GitTrendingNavigator,
         factory: GitTrendingViewModelFactory = GitTrendingViewModelFactory(),
         useCase: TrendingUseCase) {
        self.displayer = displayer
        self.navigator = navigator
        self.factory = factory
        self.useCase = useCase
    }
    
    func startPresenting() {
        useCase.fetchTopGitTrending { (response) in
            switch response {
            case .success(let repos):
                self.displayer.attachListener(listener: self.newListener())
                self.displayer.update(with: self.factory.viewModel(for: repos))
            case .failure(let error):
                self.displayer.attachListener(listener: self.newListener())
//                self.displayer.update(with: self.viewModel)
            }
        }
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
