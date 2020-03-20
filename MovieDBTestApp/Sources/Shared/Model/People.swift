//
//  People.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/11/19.
//  Copyright © 2019 CafeBazaar. All rights reserved.
//

import Foundation

struct People : Codable {
    
    let results: [Actor]?
    let page: Int
    let total_pages: Int
}
