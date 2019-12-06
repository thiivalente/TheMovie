//
//  HomeViewModel.swift
//  TheMovie
//
//  Created by Thiago Valente on 06/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import Foundation

class HomeViewModel {
    unowned let controller: HomeViewController
    let movieWorker: MovieWorkerProtocol

    lazy var currentPage = {
       return 1
    }()

    init(controller: HomeViewController) {
        self.controller = controller
        self.movieWorker = MovieWorker()
    }

    func fetchMovies() {
        movieWorker.fetchMovies(in: currentPage) { (movies) in
            self.controller.movies += movies
        }
        currentPage += 1
    }
}
