//
//  UIView+Constraints.swift
//  Luna
//
//  Created by Sergey Butorin on 03/03/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraints(withFormat format: String, views: UIView...) {
        var viewsDictionary = [String : UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
