//
//  GitTrendingModelTests.swift
//  git-trendsTests
//
//  Created by Norman, ThankaVijay on 28/09/20.
//

import XCTest
@testable import gitTrends

class GitTrendingModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testModel() {
        if let repos = Utils.readJSONFromFile(fileName: "sample", type: Repos.self) {
            for aRepo in repos {
                XCTAssertNil(aRepo.author)
                XCTAssertNil(aRepo.avatar)
                XCTAssertNil(aRepo.currentPeriodStars)
                XCTAssertNil(aRepo.description)
                XCTAssertNil(aRepo.forks)
                XCTAssertNil(aRepo.language)
                XCTAssertNil(aRepo.languageColor)
                XCTAssertNil(aRepo.name)
                XCTAssertNil(aRepo.stars)
                XCTAssertNil(aRepo.url)
                XCTAssertNil(aRepo.builtBy[0].href)
                XCTAssertNil(aRepo.builtBy[0].avatar)
                XCTAssertNil(aRepo.builtBy[0].username)
            }
        }
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
