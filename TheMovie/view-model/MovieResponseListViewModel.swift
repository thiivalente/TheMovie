//
//  MovieViewModel.swift
//  TheMovie
//
//  Created by Thiago Valente on 21/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct MovieResponseListViewModel {
    private var movieResponse = BehaviorRelay<[MovieResponse]>(value: [])

    private let movieWorker: MovieWorkerProtocol = MovieWorker()

    var movieResponseObservable: Observable<[MovieResponse]> {
        return movieResponse.asObservable()
    }

    private let disposeBag = DisposeBag()

    func fetchMovieResponse() {
        let nextPage = self.movieResponse.value.last == nil ? 0 : self.movieResponse.value.last!.page+1
        self.movieWorker.fetchMovieResponse(in: nextPage) { movieResponse in
            self.movieResponse.accept(self.movieResponse.value + [movieResponse])
        }
    }
}
