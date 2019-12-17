//
//  MovieCollectionViewCell.swift
//  TheMovie
//
//  Created by Thiago Valente on 06/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell, ViewCode {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
    }
    
    func buildConstraints() {
    }
    
    func customizeViews() {
    }
}
