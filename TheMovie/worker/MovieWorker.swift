//
//  MovieViewModel.swift
//  TheMovie
//
//  Created by Thiago Valente on 06/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import Foundation

protocol MovieAPIProtocol {
    func listMovieResponse(page: Int, _ completion: @escaping (MovieResponse) -> Void)
}

protocol MovieWorkerProtocol {
    func fetchMovieResponse(in page: Int, _ completion: @escaping (MovieResponse) -> Void)
}

class MovieWorker: MovieWorkerProtocol {

    let api = MovieAPI()

    func fetchMovieResponse(in page: Int = 10, _ completion: @escaping (MovieResponse) -> Void) {
        api.listMovieResponse(page: page) { moviesResponse in
            DispatchQueue.main.async {
                completion(moviesResponse)
            }
        }
    }

}
