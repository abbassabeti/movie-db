//
//  ActorsViewModel.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/9/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import Foundation


// MARK: - ActorsViewModel

/// _ActorsViewModel_ is a model representing an actor with title and image
class ActorsViewModel {
    let title: String
    let profilePath: URL?
    let movies: [MovieViewModel]?
    let popularity: Float?
    let id: Int?
    
    init(title: String, profilePath: URL?, movies: [MovieViewModel]?, popularity: Float?, id: Int?) {
        self.title = title
        self.profilePath = profilePath
        self.movies = movies
        self.popularity = popularity
        self.id = id
    }
}
