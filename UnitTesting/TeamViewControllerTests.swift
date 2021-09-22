//
//  TeamViewControllerTests.swift
//  Sports AppTests
//
//  Created by AhmedNadyRabea on 01/04/2021.
//

import XCTest
@testable import Sports_App

class TeamViewControllerTests: XCTestCase {
    var promise = XCTestExpectation(description: "Successful")
    var teamViewController: TeamViewController?
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        teamViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TeamViewController")
        teamViewController!.loadViewIfNeeded()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }
    
    func testTeamViewControllerOutletsToBeNil() {
        XCTAssertNotNil(teamViewController?.teamNameLabel)
        XCTAssertNotNil(teamViewController?.sinceLabel)
        XCTAssertNotNil(teamViewController?.stadiumImage)
        XCTAssertNotNil(teamViewController?.tShirtJesreyImage)
        XCTAssertNotNil(teamViewController?.descriptionTextField)
        XCTAssertNotNil(teamViewController?.keyWordLabel)
        XCTAssertNotNil(teamViewController?.facebookButtonOutlet)
    }
    
    
    
    func testAPIMockTeam() {
        //Created Class APIClientMock
        //Created json file with Mock Data
        //make idTeam variable optional with default value of 133604 (Arsenal idTeam)
        //Do not forget to create promise: XCTExpectation upove
        APIClientMock.shared.getTeam(urlLink: "https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id=133604") { (json) in
            XCTAssertNotNil(json)
            self.promise.fulfill()
        }
        wait(for: [promise], timeout: 10.0)
    }
}
