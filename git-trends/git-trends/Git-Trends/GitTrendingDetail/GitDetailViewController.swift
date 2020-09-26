//
//  GitDetailViewController.swift
//  git-trends
//
//  Created by Norman, ThankaVijay on 26/09/20.
//

import UIKit

class GitDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let yPos = self.navigationController?.navigationBar.frame.height ?? 0
        self.view.addSubview(GitDetailView(frame: CGRect(x: 0,
                                                         y: yPos,
                                                         width: self.view.frame.width,
                                                         height: self.view.frame.height - yPos)))
    }
}
