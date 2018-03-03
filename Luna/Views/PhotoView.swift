//
//  PhotoView.swift
//  Luna
//
//  Created by Sergey Butorin on 11/02/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit

class PhotoView: UIImageView {

    private let loadingActivityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = UIColor.gray
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupViews()
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
    
    private func setupViews() {
        addSubview(loadingActivityIndicator)

        addConstraints(withFormat: "H:|[v0]|", views: loadingActivityIndicator)
        addConstraints(withFormat: "V:|[v0]|", views: loadingActivityIndicator)
    }
}
