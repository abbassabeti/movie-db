//
//  MoviePresenter.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import Foundation


// MARK: - WatchListPresenterInput

/// _WatchListPresenterInput_ is a protocol for presenter input behaviours
protocol WatchListPresenterInput: WatchListInteractorOutput {
    
}


// MARK: - WatchListPresenterOutput

/// _WatchListPresenterOuput_ is a protocol for presenter output behaviours
protocol WatchListPresenterOutput: class {
    
    /// Tells the output to display movie details
    ///
    /// - parameter viewModel: The movies view model
    func displayMovies(viewModel: [MovieViewModel])
    
    // Tells the output to display an error
    ///
    /// - parameter viewModel: The error view model
    func displayError(viewModel: ErrorViewModel)
}


// MARK: - WatchListPresenter

/// _WatchListPresenter_ is a class responsible for presenting artist logic
final class WatchListPresenter {
    
    private(set) weak var output: WatchListPresenterOutput?
    
    
    // MARK: - Initializers
    
    /// Initializes a new instance of _WatchListPresenter_ with an output object
    ///
    /// - parameter output: The output that conforms to protocol _WatchListPresenterOutput_
    ///
    /// - returns: The instance of _WatchListPresenter_
    init(output: WatchListPresenterOutput) {
        
        self.output = output
    }
}


// MARK: - WatchListPresenterInput

extension WatchListPresenter: WatchListPresenterInput {
    
    
    
    /// Prepares the movie view models for presentation and tells the output to display movies
    ///
    /// - parameter movie: The movie
    func presentMovies(movies: [MovieViewModel]) {
        
        output?.displayMovies(viewModel: movies)
    }
    
    /// Prepares the error model for presentation and tells the output to display error
    ///
    /// - paramter error: The error
    func presentError(error: Error) {
        
        let errorViewModel = ErrorViewModel(title: Strings.Error.genericTitle, message: Strings.Error.genericMessage, buttonTitles: [Strings.Error.okButtonTitle])
        
        output?.displayError(viewModel: errorViewModel)
    }
}



