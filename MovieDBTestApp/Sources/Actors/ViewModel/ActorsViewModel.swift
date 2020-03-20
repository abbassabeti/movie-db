//
//  ActorsViewModel.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/9/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import Foundation


// MARK: - ActorsViewModel

/// _ActorsViewModel_ is a model representing an actor with title and image
struct ActorsViewModel {
    let title: String
    let profilePath: URL?
    let movies: [MovieViewModel]?
    let popularity: Float?
    let id: Int?
}
