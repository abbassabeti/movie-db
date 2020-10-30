//
//  MovieDBTestAppUITests.swift
//  MovieDBTestAppUITests
//
//  Created by Abbas on 5/8/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import XCTest
@testable import MovieDBTestApp

class MovieDBTestAppUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        testWhetherWatchLaterIsFunctional()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testWhetherWatchLaterIsFunctional(){
        let app = XCUIApplication()
        app.launch()
        let actorTable = app.tables.element(boundBy: 0)
        let firstActor = actorTable.cells.firstMatch
        
        XCTAssert(firstActor.waitForExistence(timeout: 5),"Failed to find a table cell in actors")
        firstActor.tap()
        sleep(1)
        let movieTable = app.tables.element(boundBy: 0)
        let firstMovie = movieTable.cells.firstMatch
        
        if (firstMovie.exists){
            firstMovie.tap()
        }
        
        let watchLaterBtn = app.buttons["Watch Later!"]

        XCTAssert(watchLaterBtn.waitForExistence(timeout: 0.05),"Failed to find watch later button")
        
        watchLaterBtn.tap()
        app.terminate()
    }

}
