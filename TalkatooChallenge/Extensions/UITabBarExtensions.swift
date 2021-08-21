//
//  UITabBarExtensions.swift
//  TalkatooChallenge
//
//  Created by mskmatt on 21/08/2021.
//

import UIKit

extension UITabBar {
    static func setTransparent() {
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().clipsToBounds = true
    }
}
