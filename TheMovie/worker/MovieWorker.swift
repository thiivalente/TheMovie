//
//  MovieViewModel.swift
//  TheMovie
//
//  Created by Thiago Valente on 06/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import Foundation

protocol MovieViewModelProtocol {
    func fetchedMovies(movies: [Movie])
}

class MovieViewModel {

    lazy var currentPage: Int = {
        return 1
    }()

    let api = MovieAPI()
    let interector: MovieViewModelProtocol!

    init(interector: MovieViewModelProtocol) {
        self.interector = interector
    }

    func fetchMovies() {
        api.listMovies(page: currentPage) { (movies) in
            self.interector.fetchedMovies(movies: movies)
        }
    }
}
