//
//  Movie.swift
//  TheMovie
//
//  Created by Thiago Valente on 06/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import Foundation

struct MovieResponse: Decodable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [Movie]
}

struct Movie: Decodable {
    var id: Int
    var title: String
    var posterPath: String?
    var adult: Bool
    var voteAvarage: Double
    var overview: String
    var releaseDate: String
}
