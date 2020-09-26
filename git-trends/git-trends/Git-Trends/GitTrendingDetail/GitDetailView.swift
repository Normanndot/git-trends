//
//  GitDetailView.swift
//  git-trends
//
//  Created by Norman, ThankaVijay on 26/09/20.
//

import Foundation
import UIKit
import WebKit
//protocol GitDetailDisplayer: class {
//    func update(with viewModel: GitTrendingViewModel)
//}

final class GitDetailView: UIView {
    lazy var yPos: CGFloat = {
        self.frame.origin.y
    }()
    
    private let icon: UIImageView = {
        let img = UIImageView()
        return img
    }()

    private let name: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "SAJDBksdjbSK"
        return label
    }()
    
    private let horizontalDividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let gitDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.text = "asdkjfnalsdkj alksdfjh aklsdfjh alskdfjh alksdfh laksdfhj aklsdjfh aklsdfhakl sdfjh aslkdjf asdjfha jlsdfhg alsjdfhg aljsdfhg alskdfhalsjk dfgalsdjk fhalsdjf alsdjfhal sdfhadls k"
        return label
    }()

    private let starCount: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "asdbjs"
        return label
    }()
    
    private let verticleDividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    private let forkCount: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "asdbjs"
        return label
    }()
    
    private let readMe: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Readme.md"
        return label
    }()
    
    lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.uiDelegate = self
        return webView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GitDetailView {
    func setup() {
        setupHierarchy()
        applyConstraints()
        let myURL = URL(string: "https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    private func setupHierarchy() {
        addSubviews(icon,
                    name,
                    horizontalDividerLine,
                    gitDescription,
                    starCount,
                    verticleDividerLine,
                    forkCount,
                    readMe,
                    webView)
    }
    
    func applyConstraints() {
        icon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: 75),
            icon.heightAnchor.constraint(equalToConstant: 75),
            icon.centerXAnchor.constraint(equalTo: centerXAnchor),
            icon.topAnchor.constraint(equalTo: topAnchor, constant: yPos + 20)
        ])
        
        name.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            name.centerXAnchor.constraint(equalTo: icon.centerXAnchor),
            name.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 20)
        ])
        
        horizontalDividerLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            horizontalDividerLine.widthAnchor.constraint(equalToConstant: 50),
            horizontalDividerLine.heightAnchor.constraint(equalToConstant: 1),
            horizontalDividerLine.centerXAnchor.constraint(equalTo: name.centerXAnchor),
            horizontalDividerLine.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20)
        ])
        
        gitDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gitDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            gitDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            gitDescription.topAnchor.constraint(equalTo: horizontalDividerLine.bottomAnchor, constant: 20)
        ])
        
        verticleDividerLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticleDividerLine.widthAnchor.constraint(equalToConstant: 1),
            verticleDividerLine.heightAnchor.constraint(equalToConstant: 30),
            verticleDividerLine.topAnchor.constraint(equalTo: gitDescription.bottomAnchor, constant: 50),
            verticleDividerLine.centerXAnchor.constraint(equalTo: gitDescription.centerXAnchor)
        ])
        
        forkCount.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forkCount.topAnchor.constraint(equalTo: verticleDividerLine.topAnchor),
            forkCount.bottomAnchor.constraint(equalTo: verticleDividerLine.bottomAnchor),
            forkCount.leadingAnchor.constraint(equalTo: verticleDividerLine.trailingAnchor, constant: 10)
        ])
        
        starCount.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            starCount.topAnchor.constraint(equalTo: verticleDividerLine.topAnchor),
            starCount.bottomAnchor.constraint(equalTo: verticleDividerLine.bottomAnchor),
            starCount.trailingAnchor.constraint(equalTo: verticleDividerLine.leadingAnchor, constant: -10)
        ])
        
        readMe.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            readMe.topAnchor.constraint(equalTo: verticleDividerLine.bottomAnchor, constant: 10),
            readMe.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40)
        ])
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.widthAnchor.constraint(equalToConstant: frame.width-40),
            webView.heightAnchor.constraint(equalToConstant: frame.width-40),
            webView.topAnchor.constraint(equalTo: readMe.bottomAnchor, constant: 10),
            webView.centerXAnchor.constraint(equalTo: gitDescription.centerXAnchor)
        ])
    }
}

extension GitDetailView: WKUIDelegate {}
