//
//  MovieAPI.swift
//  TheMovie
//
//  Created by Thiago Valente on 06/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import Foundation

protocol MovieAPIProtocol {
    func listMovies(page: Int, _ completion: @escaping ([Movie]) -> Void)
}

class MovieAPI: MovieAPIProtocol {
    func listMovies(page: Int = 1, _ completion: @escaping ([Movie]) -> Void) {
        let networkService = NetworkService()
        networkService.request(endpoint: TMDbApi.fetchPopularMovies(in: page)) { (result: Result<MovieResponse?, NetworkServiceError>) in
            switch result {
            case .success(let movieResponse):
                guard let movieResponse = movieResponse else {
                    completion([])
                    return
                }

                completion(movieResponse.results)
            case .failure(let error):
                print(error)
            }
        }
    }

}
