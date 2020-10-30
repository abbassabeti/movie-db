//
//  Actor.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/9/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import Foundation


// MARK: - Actor

/// _Actor_ is a model representation of a movie artist
struct Actor : Codable{
    let name: String
    let profile_path: URL?
    let popularity: Float?
    let id: Int?
    let known_for: [Movie]?
    let adult : Bool?
    
    enum CodingKeys : String,CodingKey {
        case name = "name"
        case profile_path = "profile_path"
        case popularity = "popularity"
        case id = "id"
        case known_for = "known_for"
        case adult = "adult"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = (try? container.decode(String.self, forKey: .name)) ?? ""
        
        if let path = try? container.decode(String.self, forKey: .profile_path){
            let raw_ = "\(MovieDBAPI.baseImageURLString)\(path)"
            if let url = URL(string: raw_) {
                self.profile_path = url
            }else {
                self.profile_path = nil
            }
        }else{
            self.profile_path = nil
        }
        
        self.popularity = try? container.decode(Float.self, forKey: .popularity)
        self.id = try? container.decode(Int.self, forKey: .id)
        self.known_for = try? container.decode(Array.self, forKey: .known_for)
        self.adult = try? container.decode(Bool.self, forKey: .adult)
    }
}
