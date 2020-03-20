//
//  ActorDetailsViewModel.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/10/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import Foundation


// MARK: - ActorDetailsViewModel

/// _ActorDetailsViewModel_ is a model representing an actor with title and image
struct ActorDetailsViewModel {
    
    let id: Int?
    let name: String
    let profilePath: URL?
    let movies: [MovieViewModel]?
    let popularity: Float?
}
