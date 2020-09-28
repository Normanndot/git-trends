//
//  GitTrendingPresenterTests.swift
//  gitTrendsTests
//
//  Created by Norman, ThankaVijay on 28/09/20.
//

import XCTest
@testable import gitTrends

class GitTrendingPresenterTests: XCTestCase {
    private var presenter: GitPresenter? = nil
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testGitTrendingPresenter() {
        let view = gitTrendingView()
        let navigator = GitTrendingViewNavigator(navigation: UINavigationController())
        let useCase = GitTrendingUseCaseSpy()
        presenter = GitTrendingViewPresenter(displayer: view,
                                             navigator: navigator,
                                             useCase: useCase)
        presenter?.startPresenting()
        navigator.toGitDetailView(model: <#T##GitTrendingRow#>)
    }
    
    private func gitTrendingView() -> GitTrendingView {
        
        let view = GitTrendingView(frame: CGRect(x: 0,
                                                 y: 0,
                                                 width: 100,
                                                 height: 100))
        return view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
