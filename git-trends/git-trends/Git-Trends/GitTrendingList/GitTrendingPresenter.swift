//
//  GitTrendingPresenter.swift
//  git-trending-app
//
//  Created by Norman, ThankaVijay on 25/09/20.
//

import Foundation

protocol GitPresenter {
    func startPresenting()
    func stopPresenting()
}

final class GitTrendingViewPresenter: GitPresenter {
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
        
        fetch(forced: true)
        let refreshHandler: (Bool) -> () = { [weak self] value in
            self?.fetch(forced: value)
        }
        
        displayer.attachRefresh(handler: refreshHandler)
        
    }
    
    private func fetch(forced: Bool = false) {
        useCase.fetchTopGitTrending(with: { (response) in
            switch response {
            case .success(let repos):
                self.displayer.attachListener(listener: self.newListener())
                self.displayer.update(with: self.factory.viewModel(for: repos))
                
                if forced {
                    self.displayer.detachRefresh()
                }
            case .failure(let error):
                print(error)
            }
        }, forcely: forced)
    }
    
    func stopPresenting() {
        displayer.detachListener()
    }
    
    private func newListener() -> GitTrendingActionlistener {
        return GitTrendingActionlistener(toGitDetailView: toGitDetailView)
    }
    
    private func toGitDetailView() {
        navigator.toGitDetailView()
    }
}
