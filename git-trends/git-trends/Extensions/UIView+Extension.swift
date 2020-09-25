//
//  UIView+Extension.swift
//  git-trending-app
//
//  Created by Norman, ThankaVijay on 25/09/20.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
