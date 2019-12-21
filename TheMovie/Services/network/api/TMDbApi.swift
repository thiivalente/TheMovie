//
//  TMDBApi.swift
//  TheMovie
//
//  Created by Thiago Valente on 06/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import Foundation

enum TMDbApi {
    case fetchPopularMovies(page: Int)
}

extension TMDbApi: EndpointType {
    var body: String? {
        return caseBody
    }

    var apiAddress: String {
        return "https://api.themoviedb.org/3"
    }

    var apiKey: String {
        return "?api_key=b470069e3989d8d44a6fa62dd80e4f8c"
    }

    var url: URL? {
        return URL(string: apiAddress + path + apiKey + query)
    }

    var httpMethod: HttpMethod {
        switch self {
        default:
            return .get
        }
    }

    var path: String {
        switch self {
        case .fetchPopularMovies:
            return "/movie/popular"
        }
    }

    var query: String {
        switch self {
        case .fetchPopularMovies(let page):
            return "&page=\(page)"
        }
    }

    var caseBody: String? {
        switch self {
        default:
            return nil
        }
    }

    var headers: [String: String]? {
        return nil
    }
}
