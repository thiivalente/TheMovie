//
//  ActivityIndicator.swift
//  TheMovie
//
//  Created by Thiago Valente on 17/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import UIKit

extension UIView {
    func showFullScreenActivityIndicator () {
        let fullScreenActivityIndicator = FullScreenActivityIndicator(frame: frame)
        fullScreenActivityIndicator.center = center
        addSubview(fullScreenActivityIndicator)

        NSLayoutConstraint.activate([
            fullScreenActivityIndicator.topAnchor.constraint(equalTo: topAnchor),
            fullScreenActivityIndicator.bottomAnchor.constraint(equalTo: bottomAnchor),
            fullScreenActivityIndicator.leadingAnchor.constraint(equalTo: leadingAnchor),
            fullScreenActivityIndicator.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        fullScreenActivityIndicator.show(animated: true)
    }

    func hideFullScreenActivityIndicator () {
        subviews.forEach { view in
            if let view = view as? FullScreenActivityIndicator {
                view.hide(animated: true) {
                    view.removeFromSuperview()
                }
            }
        }
    }
}
