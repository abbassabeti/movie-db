//
//  Actor.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/9/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
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
    
    enum Actor : String,CodingKey {
        case name = "name"
        case profile_path = "profile_path"
        case popularity = "popularity"
        case id = "id"
        case known_for = "known_for"
        case adult = "adult"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do{
            self.name = try container.decode(String.self, forKey: .name)
        }catch{
            self.name = ""
        }
        
        do{
            let path = try container.decode(String.self, forKey: .profile_path)
            let raw_ = "\(MovieDBAPI.baseImageURLString)\(path)"
            if let url = URL(string: raw_) {
                self.profile_path = url
            }else {
                
                self.profile_path = nil
            }
        }catch{
            
            self.profile_path = nil
        }
        
        
        do{
            self.popularity = try container.decode(Float.self, forKey: .popularity)
        }catch{
            self.popularity = nil
        }
        
        do{
            self.id = try container.decode(Int.self, forKey: .id)
        }catch{
            self.id = nil
        }
        
        do{
            self.known_for = try container.decode(Array.self, forKey: .known_for)
        }catch{
            self.known_for = nil
        }
        
        
        do{
            self.adult = try container.decode(Bool.self, forKey: .adult)
        }catch{
            self.adult = nil
        }
    
    }
}
