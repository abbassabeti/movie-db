//
//  Movie.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/9/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import Foundation


// MARK: - Movie

/// _Movie_ is a model representation of a movie
struct Movie : Codable{
    
    let title: String?
    let popularity: Float?
    let posterPath: URL?
    let originalLanguage: String?
    let originalTitle: String?
    let originalName: String?
    let voteAverage: Float?
    let voteCount: Int?
    let id: Int?
    let video: Bool?
    let mediaType: String?
    let genreIds: [Int]?
    let backdropPath: URL?
    let adult: Bool?
    let overview: String?
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey { // declaring our keys
        case title = "title"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case id = "id"
        case video = "video"
        case mediaType = "media_type"
        case genreIds = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult = "adulet"
        case overview = "overview"
        case releaseDate = "release_date"
        case originalTitle = "original_title"
        case originalName = "original_name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try? container.decode(String.self, forKey: .title)
        self.originalTitle = try? container.decode(String.self, forKey: .originalTitle)
        self.originalName = try? container.decode(String.self, forKey: .originalName)
        self.popularity = try? container.decode(Float.self, forKey: .popularity)
        
        if let path = try? container.decode(String.self, forKey: .posterPath) {
            if let url = URL(string: "\(MovieDBAPI.baseImageURLString)\(path)") {
                self.posterPath = url
            }else{
                self.posterPath = nil
            }
        }else{
            self.posterPath = nil
        }
        
        self.originalLanguage = try? container.decode(String.self, forKey: .originalLanguage)
        self.voteAverage = try? container.decode(Float.self, forKey: .voteAverage)
        self.voteCount = try? container.decode(Int.self, forKey: .voteCount)
        self.id = try? container.decode(Int.self, forKey: .id)
        self.video = try? container.decode(Bool.self, forKey: .video)
        self.mediaType = try? container.decode(String.self, forKey: .mediaType)
        self.genreIds = try? container.decode(Array.self, forKey: .genreIds)
        if let path = try? container.decode(String.self, forKey: .backdropPath){
            if let url = URL(string: "\(MovieDBAPI.baseImageURLString)\(path)") {

                self.backdropPath = url
            }else{
                self.backdropPath = nil
            }
        }else{
            self.backdropPath = nil
        }
        self.adult = try? container.decode(Bool.self, forKey: .adult)
        self.overview = try? container.decode(String.self, forKey: .overview)
        self.releaseDate = try? container.decode(String.self, forKey: .releaseDate)
    }
}
