//
//  MoviePresenter.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import Foundation


// MARK: - MovieDetailsPresenterInput

/// _MovieDetailsPresenterInput_ is a protocol for presenter input behaviours
protocol MovieDetailsPresenterInput: MovieDetailsInteractorOutput {
    
}


// MARK: - MovieDetailsPresenterOutput

/// _MovieDetailsPresenterOuput_ is a protocol for presenter output behaviours
protocol MovieDetailsPresenterOutput: class {
    
}


// MARK: - MovieDetailsPresenter

/// _MovieDetailsPresenter_ is a class responsible for presenting movie logic
final class MovieDetailsPresenter {
    
    private(set) weak var output: MovieDetailsPresenterOutput?
    
    
    // MARK: - Initializers
    
    /// Initializes a new instance of _MovieDetailsPresenter_ with an output object
    ///
    /// - parameter output: The output that conforms to protocol _MovieDetailsPresenterOutput_
    ///
    /// - returns: The instance of _MovieDetailsPresenter_
    init(output: MovieDetailsPresenterOutput) {
        
        self.output = output
    }
}


// MARK: - MovieDetailsPresenterInput

extension MovieDetailsPresenter: MovieDetailsPresenterInput {
    
}



