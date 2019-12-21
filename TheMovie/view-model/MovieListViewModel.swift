//
//  MovieResponseViewModel.swift
//  TheMovie
//
//  Created by Thiago Valente on 21/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct MovieListViewModel {

    private let movieWorker: MovieWorkerProtocol = MovieWorker()

    var movieResponse = BehaviorRelay<[MovieResponse]>(value: [])
    var moviesBehaviorRelay = BehaviorRelay<[Movie]>(value: [])

    func fetchMovies() {
        let nextPage = movieResponse.value.last == nil ? 0 : movieResponse.value.last!.page+1
        movieWorker.fetchMovieResponse(in: nextPage) { movieResponse in
            self.movieResponse.accept(self.movieResponse.value + [movieResponse])
            self.moviesBehaviorRelay.accept(self.moviesBehaviorRelay.value + movieResponse.results)
        }
    }

    func movieAt(_ index: Int) -> Movie {
        return moviesBehaviorRelay.value[index]
    }

    func totalMovies() -> Int {
        return self.moviesBehaviorRelay.value.count
    }

    func canFetch() -> Bool {
        guard let lastResponse = movieResponse.value.last else {
            return true
        }
        return lastResponse.page < lastResponse.totalPages
    }
}
