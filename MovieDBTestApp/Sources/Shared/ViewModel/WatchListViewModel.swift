//
//  WatchListViewModel.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/13/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import Foundation

class WatchListViewModel {
    let movies: [Int]?
    let actors: [Int]?
    
    init(movies: [Int]?, actors: [Int]?) {
        self.movies = movies
        self.actors = actors
    }
}
