//
//  ViewController.swift
//  TheMovie
//
//  Created by Thiago Valente on 06/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: AppViewController {

    private var customView = HomeView()

    let movieListViewModel = MovieListViewModel()
    let disposeBag = DisposeBag()

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultViewControllerConfiguration()
        loadData()
    }

    func defaultViewControllerConfiguration () {
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self
    }

    func loadData() {
        movieListViewModel.moviesBehaviorRelay.subscribe(onNext: { _ in
//            self.customView.collectionView.performBatchUpdates({
//                let indexPath = IndexPath(row: self.movieListViewModel.moviesBehaviorRelay.value.count-1, section: 0)
//                self.customView.collectionView.insertItems(at: [indexPath])
//            }, completion: nil)
            self.customView.collectionView.reloadData()
        }).disposed(by: disposeBag)

        movieListViewModel.fetchMovies()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieListViewModel.totalMovies()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = movieListViewModel.movieAt(indexPath.row)

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customView.collectionView.cellIdentifier, for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
        if let posterPath = movie.posterPath {
            cell.imageView.downloaded(from: posterPath, contentMode: .scaleAspectFill)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == movieListViewModel.totalMovies() - 6 && movieListViewModel.canFetch() {
            movieListViewModel.fetchMovies()
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let numberOfitemsForRow: CGFloat = 3

        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return .zero }

        let totalSpace = flowLayout.sectionInset.left
                        + flowLayout.sectionInset.right
                        + (flowLayout.minimumInteritemSpacing * CGFloat(numberOfitemsForRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(numberOfitemsForRow))

        return CGSize(width: size, height: Int(Double(size)*1.5))
    }
}
