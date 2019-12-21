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
    var movies = BehaviorRelay<[Movie]>(value: [])

    var moviesObservable: Observable<[Movie]> {
        return movies.asObservable()
    }

    private let movieResponseListVM = MovieResponseListViewModel()
    private let disposeBag = DisposeBag()

    func fetchMovies() {
        movieResponseListVM.movieResponseObservable.subscribe(onNext: { responses in
            responses.forEach { response in
                let currentValues = self.movies.value
                self.movies.accept(currentValues + response.results)
            }
        }).disposed(by: disposeBag)
        movieResponseListVM.fetchMovieResponse()
    }
}
