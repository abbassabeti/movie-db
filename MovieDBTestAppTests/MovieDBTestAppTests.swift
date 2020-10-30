//
//  MovieDBTestAppTests.swift
//  MovieDBTestAppTests
//
//  Created by Abbas on 5/8/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import XCTest
@testable import MovieDBTestApp

class MovieDBTestAppTests: XCTestCase {

    override func setUp() {
        super.setUp()
        testThatWatchLaterListIsWorking()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testThatWatchLaterListIsWorking(){
        let initialMoviesCount = WatchlistWorker.sharedInstance.loadMovies()?.count ?? 0
        let sampleMovieVM1 = MovieViewModel(title: "test1", backdropPath: nil, voteAverage: 5, voteCount: 100, overview: "Blah Blah Blah", releaseDate: "2019-10-10", id: 1234, originalName: "Test1")
        let sampleMovieVM2 = MovieViewModel(title: "test2", backdropPath: nil, voteAverage: 6, voteCount: 120, overview: "Blah Blah Blah", releaseDate: "2019-10-10", id: 1235, originalName: "Test2")
        let save1 = WatchlistWorker.sharedInstance.toggleMovie(movie: sampleMovieVM1)
        let save2 = WatchlistWorker.sharedInstance.toggleMovie(movie: sampleMovieVM2)
        
        XCTAssert(save1,"Movie 1 not saved")
        XCTAssert(save2,"Movie 2 not saved")
        
        let step1Count = WatchlistWorker.sharedInstance.getCurrentMovies()?.count ?? 0
        XCTAssert(step1Count - 2 == initialMoviesCount,"Movie Count is not added by 2")
        let unsave1 = WatchlistWorker.sharedInstance.toggleMovie(movie: sampleMovieVM1)
        XCTAssert(unsave1,"Movie 1 not unsaved")
        let step2Count = WatchlistWorker.sharedInstance.getCurrentMovies()?.count ?? 0
        XCTAssert(step2Count - 1 == initialMoviesCount,"Movie Count is not added by 1")
        let unsave2 = WatchlistWorker.sharedInstance.toggleMovie(movie: sampleMovieVM2)
        XCTAssert(unsave2,"Movie 2 not unsaved")
        let step3Count = WatchlistWorker.sharedInstance.getCurrentMovies()?.count ?? 0
        XCTAssert(step3Count == initialMoviesCount,"Movie Count is not same as the initial")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
