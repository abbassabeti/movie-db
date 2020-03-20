//
//  API.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/8/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import Foundation

// MARK: - MovieDBAPI

/// _MovieDBAPI_ is a struct responsible for Movie DB API Configuration
struct MovieDBAPI {
    static let HTTPSScheme = "https"
    static let baseImageURLString = "http://image.tmdb.org/t/p/original/"
    static let baseURLString = "api.themoviedb.org"
    static let apiKey = "9815239d222e16fb801212662eea7bf5" // TODO I will make it more secure, later.
    static let defaultLang = "en-US"
}

/// URLConvertible_ is a protocol to implement urls

protocol URLConvertible {
    func url() -> URL?
}

// MARK: - MovieDBAPIEndpoint

/// _MovieDBAPIEndpoint_ is an enumeration of all Movie DB types of API requests
///
/// - getTopArtists:
/// - getActorDetails:
/// - getMovieDetails:

enum MovieDBAPIEndPoint {
    
    case getTopActors( String?, Int)
}


// MARK: - URLConvertible

extension MovieDBAPIEndPoint: URLConvertible {
    
    func url() -> URL? {
        
        switch self {
            
        case .getTopActors(let query, let page):
            
            
            if ((query ?? "").isEmpty) {
                let method = "/3/person/popular"
                let queryApi = URLQueryItem(name: "api_key", value: MovieDBAPI.apiKey)
                let queryLng = URLQueryItem(name: "language", value: MovieDBAPI.defaultLang)
                let queryPage = URLQueryItem(name: "page", value: String(page))
                var urlComps = URLComponents()
                urlComps.scheme = MovieDBAPI.HTTPSScheme
                urlComps.host = MovieDBAPI.baseURLString
                urlComps.path = method
                urlComps.queryItems = [queryApi,queryLng,queryPage]
                return urlComps.url
            }else{
                let method = "/3/search/person"
                let queryApi = URLQueryItem(name: "api_key", value: MovieDBAPI.apiKey)
                let queryLng = URLQueryItem(name: "language", value: MovieDBAPI.defaultLang)
                let queryPage = URLQueryItem(name: "page", value: String(page))
                let querySeach = URLQueryItem(name: "query", value: query)
                var urlComps = URLComponents()
                urlComps.scheme = MovieDBAPI.HTTPSScheme
                urlComps.host = MovieDBAPI.baseURLString
                urlComps.path = method
                urlComps.queryItems = [queryApi,queryLng,queryPage, querySeach]
                return urlComps.url
            }
        }
    }
}
