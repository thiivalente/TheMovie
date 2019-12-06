//
//  ColorMode.swift
//  TheMovie
//
//  Created by Thiago Valente on 06/12/19.
//  Copyright © 2019 Thiago Valente. All rights reserved.
//

import UIKit

/// If darkmode enable set darkmode if activated
/// - Parameter lightmode: lightmode color
/// - Parameter darkmode: darkmode color
func colorMode(lightMode: UIColor, darkMode: UIColor) -> UIColor {
    if #available(iOS 13, *) {
        return UIColor(dynamicProvider: { (trait) -> UIColor in
            if trait.userInterfaceStyle == .dark {
                return darkMode
            } else {
                return lightMode
            }
        })
    } else {
        return lightMode
    }
}
