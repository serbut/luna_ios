//
//  LPhotoView.swift
//  Luna
//
//  Created by Sergey Butorin on 11/02/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit

class LPhotoView: UIImageView {

    fileprivate var loadingActivityIndicator: UIActivityIndicatorView!
    
    override func willMove(toSuperview newSuperview: UIView?) {
        setupActivityIndicator()
        setupConstraints()
    }
    
    func setImage(_ image: UIImage?) {
        if let image = image {
            loadingActivityIndicator.stopAnimating()
            self.image = image
        } else {
            loadingActivityIndicator.startAnimating()
            self.image = nil
        }
    }
    
    private func setupActivityIndicator() {
        loadingActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        loadingActivityIndicator.hidesWhenStopped = true
        loadingActivityIndicator.startAnimating()
        addSubview(loadingActivityIndicator)
    }
    
    private func setupConstraints() {
        loadingActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingActivityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadingActivityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
