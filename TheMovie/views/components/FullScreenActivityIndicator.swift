//
//  FullScreenActivityIndicator.swift
//  TheMovie
//
//  Created by Thiago Valente on 17/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import UIKit

class FullScreenActivityIndicator: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        customize()
        createSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func customize () {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.rgba(0, 0, 0, 0.2)
        layer.opacity = 0
    }

    private func createSubviews () {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppStyleGuide.Colors.background.uiColor.withAlphaComponent(0.8)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        addSubview(view)

        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.style = UIActivityIndicatorView.Style.medium

        if #available(iOS 13, *) {
            activityIndicatorView.style = .large
        }
        activityIndicatorView.startAnimating()

        view.addSubview(activityIndicatorView)

        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: centerXAnchor),
            view.centerYAnchor.constraint(equalTo: centerYAnchor),
            view.widthAnchor.constraint(equalToConstant: 80),
            view.heightAnchor.constraint(equalToConstant: 80),

            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func show (animated: Bool = false, completion: (() -> Void)? = nil) {
        if animated {
            UIView.animate(withDuration: 0.3, animations: {
                self.layer.opacity = 1
            }, completion: { _ in
                completion?()
            })
        }

        layer.opacity = 1
        return
    }

    func hide (animated: Bool = false, completion: (() -> Void)? = nil) {
        if animated {
            UIView.animate(withDuration: 0.3, animations: {
                self.layer.opacity = 0
            }, completion: { _ in
                completion?()
            })
        }

        layer.opacity = 0
        return
    }
}
