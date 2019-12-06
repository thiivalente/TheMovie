//
//  AppStyleGuide.swift
//  TheMovie
//
//  Created by Thiago Valente on 06/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import UIKit

enum AppStyleGuide {

    // MARK: Margins
    enum Margins: CGFloat {
        case xsmall = 4.0
        case small = 8.0
        case medium = 16.0
        case large = 32.0
        case xlarge = 64.0
    }

    enum Colors {
        case primary
        case background

        var uiColor: UIColor {
            switch self {
            case .primary:
                return colorMode(lightMode: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                 darkMode: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
            case .background:
                return colorMode(lightMode: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                                 darkMode: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            }
        }
    }
}
