//
//  MovieViewModel.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/13/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import Foundation

class MovieViewModel {
    
    let title : String?
    let backdropPath: URL?
    let voteAverage: Float?
    let voteCount: Int?
    let overview: String?
    let releaseDate: String?
    let id: Int?
    let originalName: String?
    
    
    init(title : String?, backdropPath: URL?, voteAverage: Float?, voteCount: Int?, overview: String?, releaseDate: String?, id: Int?, originalName: String?) {
        self.title = title
        self.backdropPath = backdropPath
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        self.overview = overview
        self.releaseDate = releaseDate
        self.id = id
        self.originalName = originalName
    }
}
