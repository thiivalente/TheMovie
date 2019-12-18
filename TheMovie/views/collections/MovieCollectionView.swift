//
//  MovieCollectionView.swift
//  TheMovie
//
//  Created by Thiago Valente on 06/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import UIKit

class MovieCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        defaultCollectionViewFlowLayoutConfiguration()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func defaultCollectionViewFlowLayoutConfiguration () {
        scrollDirection = .vertical
        sectionInset = UIEdgeInsets(margin: AppStyleGuide.Margins.xsmall.rawValue)
        minimumLineSpacing = AppStyleGuide.Margins.xsmall.rawValue
        minimumInteritemSpacing = AppStyleGuide.Margins.xsmall.rawValue
    }
}

class MovieCollectionView: UICollectionView, ViewCode {
    private let flowLayout = MovieCollectionViewFlowLayout()

    let cellIdentifier = "MovieCollectionViewCell"

    init() {
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func buildConstraints() {}

    func customizeViews() {
        backgroundColor = AppStyleGuide.Colors.background.uiColor
        registerCells()
    }

    private func registerCells () {
        register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
}
