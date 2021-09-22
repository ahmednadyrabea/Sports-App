//
//  LeagueViewControllerTests.swift
//  Sports AppTests
//
//  Created by AhmedNadyRabea on 01/04/2021.
//

import XCTest
@testable import Sports_App

class LeagueViewControllerTests: XCTestCase {
    var promise = XCTestExpectation(description: "Successfull")
    var leagueViewController: LeagueViewController?
    override func setUpWithError() throws {
        try super.setUpWithError()
        leagueViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LeagueViewController")
        leagueViewController!.loadViewIfNeeded()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }
    
    func testCollectionViewDelegateAndDataSource() {
        XCTAssertNotNil(leagueViewController?.topCollectionView.delegate)
        XCTAssertNotNil(leagueViewController?.topCollectionView.dataSource)
        XCTAssertNotNil(leagueViewController?.middleCollectionView.delegate)
        XCTAssertNotNil(leagueViewController?.middleCollectionView.dataSource)
        XCTAssertNotNil(leagueViewController?.buttomCollectionView.delegate)
        XCTAssertNotNil(leagueViewController?.buttomCollectionView.dataSource)

    }

    
    
    func testDidSelectCell() {
        guard let collectionView = leagueViewController?.topCollectionView else {
            XCTFail()
            return
        }
    }
    
    
    func testAPIMockGetLeagueTeams() {
        APIClientMock.shared.getLeagueTeams(urlLink: "https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id=4328") { (json) in
            XCTAssertNotNil(json)
            self.promise.fulfill()
        }
        wait(for: [promise], timeout: 10.0)
    }
}
