//
//  MovieDetailsInteractor.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import UIKit


// MARK: - MovieDetailsInteractorInput

/// _MovieDetailsInteractorInput_ is a protocol for interactor input behaviours
protocol MovieDetailsInteractorInput: MovieDetailsViewControllerOutput {
    
}


// MARK: - MovieDetailsInteractorInput

/// _MovieDetailsInteractorOuput_ is a protocol for interactor output behaviours
protocol MovieDetailsInteractorOutput {
    
}


// MARK: - MovieDetailsInteractor

/// _MovieDetailsInteractor_ is an interactor responsible for movie details business logic
final class MovieDetailsInteractor: MovieDetailsInteractorInput {
    var movies: [Movie]?
    
    
    func addToWatchList(movieId: Int) {
        
    }
    
    func removeFromWatchList(movieId: Int) {
        
    }
    
    let output: MovieDetailsInteractorOutput
    let worker: MovieDetailsWorker
    
    
    // MARK: - Initializers
    
    /// Initializes an instance of _MovieDetailsInteractor_ with an output and a worker
    ///
    /// - parameter output: The interactor output
    /// - parameter worker: The movie worker used to fetch movies
    ///
    /// - returns: An instance of _MovieDetailsInteractor_
    init(output: MovieDetailsInteractorOutput, worker: MovieDetailsWorker = MovieDetailsWorker()){
        
        self.output = output
        self.worker = worker
    }
}
