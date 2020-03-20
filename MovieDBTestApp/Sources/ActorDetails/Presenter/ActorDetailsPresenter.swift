//
//  MoviePresenter.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import Foundation


// MARK: - ActorDetailsPresenterInput

/// _ActorDetailsPresenterInput_ is a protocol for presenter input behaviours
protocol ActorDetailsPresenterInput: ActorDetailsInteractorOutput {
    
}


// MARK: - ActorDetailsPresenterOutput

/// _MoviePresenterOuput_ is a protocol for presenter output behaviours
protocol ActorDetailsPresenterOutput: class {
    
    /// Tells the output to display movie details
    ///
    /// - parameter viewModel: The movie view model
    func displayMovie(viewModel: MovieViewModel)
    
    // Tells the output to display an error
    ///
    /// - parameter viewModel: The error view model
    func displayError(viewModel: ErrorViewModel)
}


// MARK: - ActorPresenter

/// _ActorPresenter_ is a class responsible for presenting artist logic
final class ActorDetailsPresenter {
    
    private(set) weak var output: ActorDetailsPresenterOutput?
    
    
    // MARK: - Initializers
    
    /// Initializes a new instance of _ActorPresenter_ with an output object
    ///
    /// - parameter output: The output that conforms to protocol _ActorPresenterOutput_
    ///
    /// - returns: The instance of _ActorPresenter_
    init(output: ActorDetailsPresenterOutput) {
        
        self.output = output
    }
}


// MARK: - ActorDetailsPresenterInput

extension ActorDetailsPresenter: ActorDetailsPresenterInput {
    
    /// Prepares the movie view models for presentation and tells the output to display movies
    ///
    /// - parameter movie: The movie
    func presentMovie(movie: Movie) {
        
        let title = movie.title ?? movie.original_title ?? movie.original_name
        let viewModel = MovieViewModel(title: title , backdropPath: movie.backdrop_path, vote_average: movie.vote_average, vote_count: movie.vote_count, overview: movie.overview, release_date: movie.release_date, id: movie.id, original_name: movie.original_title)
        
        output?.displayMovie(viewModel: viewModel)
    }
    
    /// Prepares the error model for presentation and tells the output to display error
    ///
    /// - paramter error: The error
    func presentError(error: Error) {
        
        let errorViewModel = ErrorViewModel(title: Strings.Error.genericTitle, message: Strings.Error.genericMessage, buttonTitles: [Strings.Error.okButtonTitle])
        
        output?.displayError(viewModel: errorViewModel)
    }
}


