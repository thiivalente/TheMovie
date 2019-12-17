//
//  ViewCode.swift
//  TheMovie
//
//  Created by Thiago Valente on 06/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import Foundation

protocol ViewCode {
    func buildViewHierarchy()
    func buildConstraints()
    func customizeViews()
    func setup()
}

extension ViewCode {
    func setup() {
        buildViewHierarchy()
        buildConstraints()
        customizeViews()
    }
}
