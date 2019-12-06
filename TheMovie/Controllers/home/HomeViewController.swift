//
//  ViewController.swift
//  TheMovie
//
//  Created by Thiago Valente on 06/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var movies: [Movie] = []
    var viewModel: HomeViewModel {
        return HomeViewModel(controller: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    func loadData() {
        viewModel.fetchMovies()
    }

}
