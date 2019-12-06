//
//  MovieViewModel.swift
//  TheMovie
//
//  Created by Thiago Valente on 06/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import Foundation

protocol MovieAPIProtocol {
    func listMovies(page: Int, _ completion: @escaping ([Movie]) -> Void)
}

protocol MovieWorkerProtocol {
    func fetchMovies(in page: Int, _ completion: @escaping ([Movie]) -> Void)
}

class MovieWorker: MovieWorkerProtocol {

    let api = MovieAPI()

    func fetchMovies(in page: Int = 10, _ completion: @escaping ([Movie]) -> Void) {
        api.listMovies(page: page) { (movies) in
            DispatchQueue.main.async {
                completion(movies)
            }
        }
    }

}
