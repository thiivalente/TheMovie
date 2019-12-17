//
//  MovieAPI.swift
//  TheMovie
//
//  Created by Thiago Valente on 06/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import Foundation

class MovieAPI: MovieAPIProtocol {
    func listMovies(page: Int = 1, _ completion: @escaping ([Movie]) -> Void) {
        let networkService = NetworkService()
        networkService.request(endpoint: TMDbApi.fetchPopularMovies(page: page)) { (result: Result<MovieResponse?, NetworkServiceError>) in
            switch result {
            case .success(let movieResponse):
                guard let movieResponse = movieResponse else {
                    completion([])
                    return
                }
                movieResponse.results.forEach({
                    if let path = $0.posterPath {
                        $0.posterPath = "https://image.tmdb.org/t/p/w500" + path
                    }
                })
                completion(movieResponse.results)
            case .failure(let error):
                print(error)
            }
        }
    }
}
