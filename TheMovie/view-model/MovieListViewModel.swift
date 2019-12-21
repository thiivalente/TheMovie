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

    var movieResponseBehavior = BehaviorRelay<[MovieResponse]>(value: [])

    func fetchMovies() {
        let nextPage = movieResponseBehavior.value.last == nil ? 1 : movieResponseBehavior.value.last!.page+1
        movieWorker.fetchMovieResponse(in: nextPage) { movieResponse in
            self.movieResponseBehavior.accept(self.movieResponseBehavior.value + [movieResponse])
        }
    }

    func movieAt(_ index: Int) -> Movie? {
        guard let lastMovie = movieResponseBehavior.value.last else { return nil}
        return lastMovie.results[index % movieWorker.perPage]
    }

    func totalMovies() -> Int {
        guard let lastResponse = movieResponseBehavior.value.last else {
            return 0
        }
        if lastResponse.page != lastResponse.totalPages {
            return lastResponse.page * movieWorker.perPage
        }
        return lastResponse.totalResults
    }

    func firstRowInPage() -> Int {
        return (self.movieResponseBehavior.value.count - 1) * movieWorker.perPage
    }

    func canFetch() -> Bool {
        guard let lastResponse = movieResponseBehavior.value.last else {
            return true
        }
        return lastResponse.page < lastResponse.totalPages
    }
}
