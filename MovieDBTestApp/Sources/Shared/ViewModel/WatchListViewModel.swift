//
//  WatchListViewModel.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/13/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import Foundation

// MARK: - WatchListViewModel

/// TODO: defining a more generalized favorite list of actors and movies

class WatchListViewModel {
    let movies: [Int]?
    let actors: [Int]?
    
    init(movies: [Int]?, actors: [Int]?) {
        self.movies = movies
        self.actors = actors
    }
}
