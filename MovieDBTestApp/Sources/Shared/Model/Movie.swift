//
//  Movie.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/9/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import Foundation


// MARK: - Movie

/// _Movie_ is a model representation of a movie
struct Movie : Codable{
    
    let title: String?
    let popularity: Float?
    let poster_path: URL?
    let original_language: String?
    let original_title: String?
    let original_name: String?
    let vote_average: Float?
    let vote_count: Int?
    let id: Int?
    let video: Bool?
    let media_type: String?
    let genre_ids: [Int]?
    let backdrop_path: URL?
    let adult: Bool?
    let overview: String?
    let release_date: String?
    
    enum MyStructKeys: String, CodingKey { // declaring our keys
        case title = "title"
        case popularity = "popularity"
        case poster_path = "poster_path"
        case original_language = "original_language"
        case vote_average = "vote_average"
        case vote_count = "vote_count"
        case id = "id"
        case video = "video"
        case media_type = "media_type"
        case genre_ids = "genre_ids"
        case backdrop_path = "backdrop_path"
        case adult = "adulet"
        case overview = "overview"
        case release_date = "release_date"
        case original_title = "original_title"
        case original_name = "original_name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do{
            self.title = try container.decode(String.self, forKey: .title)
        }catch{
            self.title = nil
        }
        
        do{
            self.original_title = try container.decode(String.self, forKey: .original_title)
        }catch{
            self.original_title = nil
        }
        
        do{
            self.original_name = try container.decode(String.self, forKey: .original_name)
        }catch{
            self.original_name = nil
        }
        
        do{
            self.popularity = try container.decode(Float.self, forKey: .popularity)
        }catch{
            self.popularity = nil
        }
        
        do{
            let path = try container.decode(String.self, forKey: .poster_path)
            if let url = URL(string: "\(MovieDBAPI.baseImageURLString)\(path)") {
                self.poster_path = url
            }else {
                
                self.poster_path = nil
            }
        }catch{
            
            self.poster_path = nil
        }
        
        do{
            self.original_language = try container.decode(String.self, forKey: .original_language)
        }catch{
            self.original_language = nil
        }
        
        
        do{
            self.vote_average = try container.decode(Float.self, forKey: .vote_average)
        }catch{
            self.vote_average = nil
        }
        
        do{
            self.vote_count = try container.decode(Int.self, forKey: .vote_count)
        }catch{
            self.vote_count = nil
        }
        
        do{
            self.id = try container.decode(Int.self, forKey: .id)
        }catch{
            self.id = nil
        }
        
        do{
            self.video = try container.decode(Bool.self, forKey: .video)
        }catch{
            self.video = nil
        }
        
        do{
            self.media_type = try container.decode(String.self, forKey: .media_type)
        }catch{
            self.media_type = nil
        }
        
        do{
            self.genre_ids = try container.decode(Array.self, forKey: .genre_ids)
        }catch{
            self.genre_ids = nil
        }
        
        do{
            let path = try container.decode(String.self, forKey: .backdrop_path)
            if let url = URL(string: "\(MovieDBAPI.baseImageURLString)\(path)") {

                self.backdrop_path = url
            }else {
                
                self.backdrop_path = nil
            }
        }catch{
            
            self.backdrop_path = nil
        }
        
        do{
            self.adult = try container.decode(Bool.self, forKey: .adult)
        }catch{
            self.adult = nil
        }
        
        do{
            self.overview = try container.decode(String.self, forKey: .overview)
        }catch{
            self.overview = nil
        }
        
        do{
            self.release_date = try container.decode(String.self, forKey: .release_date)
        }catch{
            self.release_date = nil
        }
    }
}
