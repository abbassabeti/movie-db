//
//  ActorsPresenter.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/9/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit


// MARK: - ActorsPresenterInput

/// _ActorsPresenterInput_ is a protocol for presenter input behaviours
protocol ActorsPresenterInput: ActorsInteractorOutput {
    
}


// MARK: - ArtistsPresenterOutput

/// _ActorsPresenterOutput_ is a protocol for presenter output behaviours
protocol ActorsPresenterOutput: class {
    
    /// Tells the output to display actors
    ///
    /// - parameter viewModels: The actors view models
    func displayActors(viewModels: [ActorsViewModel])
    
    /// Tells the output to display an error
    ///
    /// - parameter viewModel: The error view model
    func displayError(viewModel: ErrorViewModel)
}


// MARK: - ActorsPresenter

/// _ActorsPresenter_ is a class responsible for presenting actors logic
final class ActorsPresenter {
    
    private(set) weak var output: ActorsPresenterOutput?
    
    // MARK: - Initializers
    
    init(output: ActorsPresenterOutput) {
        
        self.output = output
    }
}


// MARK: - ActorsPresenterInput

extension ActorsPresenter : ActorsPresenterInput {
    
    /// Prepares the actors models for presentation and tells the output to display actors
    ///
    /// - parameter actors: The list of actors
    func presentActors(actors: People) {
        guard let actorsArray = actors.results else {
            let errorViewModel = ErrorViewModel(title: Strings.Error.genericTitle,
                                                message: Strings.Error.genericMessage,
                                                buttonTitles: [Strings.Error.okButtonTitle])
            output?.displayError(viewModel: errorViewModel)
            return
        }
        let viewModels = actorsArray.compactMap{ actor -> ActorsViewModel in
            
            let moviesViewModel = actor.known_for?.compactMap{ movieItem -> MovieViewModel in
                
                let title = movieItem.title ?? movieItem.originalTitle ?? movieItem.originalName
                
                return MovieViewModel(title: title ?? movieItem.originalTitle,backdropPath: movieItem.backdropPath,voteAverage: movieItem.voteAverage,voteCount: movieItem.voteCount,overview: movieItem.overview,releaseDate: movieItem.releaseDate,id: movieItem.id,originalName: movieItem.originalTitle)
            }
            
            return ActorsViewModel(title: actor.name, profilePath: actor.profile_path,movies: moviesViewModel,popularity: actor.popularity,id: actor.id)
        }
        DispatchQueue.main.async {
            self.output?.displayActors(viewModels: viewModels)
        }
    }
    
    /// Prepares the error model for presentation and tells the output to display error
    ///
    /// - parameter error: The error
    func presentError(error: Error) {
        
        let errorViewModel = ErrorViewModel(title: Strings.Error.genericTitle,
                                            message: Strings.Error.genericMessage,
                                            buttonTitles: [Strings.Error.okButtonTitle])
        DispatchQueue.main.async {
            self.output?.displayError(viewModel: errorViewModel)
        }
    }
}
