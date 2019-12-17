//
//  HomeView.swift
//  TheMovie
//
//  Created by Thiago Valente on 17/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import UIKit

class HomeView: UIView, ViewCode {

    let collectionView: MovieCollectionView = {
        let view = MovieCollectionView()
        view.backgroundColor = AppStyleGuide.Colors.background.uiColor
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        addSubview(collectionView)
    }

    func buildConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func customizeViews() {

    }

}
