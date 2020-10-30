//
//  ActorDetailsViewModel.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import Foundation


// MARK: - ActorDetailsViewModel

/// _ActorDetailsViewModel_ is a model representing an actor with title and image
class ActorDetailsViewModel {
    
    let id: Int?
    let name: String
    let profilePath: URL?
    let movies: [MovieViewModel]?
    let popularity: Float?
    
    init(id: Int?, name: String, profilePath: URL?, movies: [MovieViewModel]?, popularity: Float?) {
        self.id = id
        self.name = name
        self.profilePath = profilePath
        self.movies = movies
        self.popularity = popularity
    }
}
