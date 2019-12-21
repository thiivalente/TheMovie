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
    private var movieResponse = PublishSubject<[MovieResponse]>()

    private let movieWorker: MovieWorkerProtocol = MovieWorker()

    var movieResponseObservable: Observable<[MovieResponse]> {
        return movieResponse.asObservable()
    }

    private let disposeBag = DisposeBag()
    
    func fetchMovieResponse() {
        movieResponse.subscribe(onNext: {
            let nextPage = $0.last == nil ? 0 : $0.last!.page+1
            self.movieWorker.fetchMovies(in: nextPage) { movies in
                // Change to movieResponse
            }
        }).disposed(by: disposeBag)
    }
}
