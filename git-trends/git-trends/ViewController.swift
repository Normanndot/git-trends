//
//  ViewController.swift
//  git-trends
//
//  Created by Norman, ThankaVijay on 25/09/20.
//

import UIKit

class ViewController: UIViewController {
    private var presenter: GitTrendingPresenter? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()

    }

    private func setUp() {
        self.title = "Github Trends"
        let view = gitTrendingView()
        let navigator = GitTrendingViewNavigator(navigation: self.navigationController)
        presenter = GitTrendingViewPresenter(displayer: view, navigator: navigator)
        presenter?.startPresenting()
    }
    
    private func gitTrendingView() -> GitTrendingView {
        
        let view = GitTrendingView(frame: CGRect(x: 0,
                                                 y: 0,
                                                 width: self.view.frame.width,
                                                 height: self.view.frame.height))
        self.view.addSubview(view)
        return view
    }
    
    deinit {
        presenter?.stopPresenting()
    }


}

