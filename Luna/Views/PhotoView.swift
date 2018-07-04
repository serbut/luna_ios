//
//  PhotoView.swift
//  Luna
//
//  Created by Sergey Butorin on 11/02/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit
import Alamofire

fileprivate let imageCache = NSCache<NSURL, UIImage>()

class PhotoView: UIImageView {

    private let loadingActivityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = UIColor.gray
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    var imageUrl: URL?
    
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
    
    func downloadImage(withUrl url: URL) {
        imageUrl = url
        self.setImage(nil)
        
        if let imageFromCache = imageCache.object(forKey: url as NSURL) {
            self.setImage(imageFromCache)
            return
        }
        Alamofire.request(url)
            .responseData { response in
                guard let data = response.result.value,
                    let image = UIImage(data: data) else {
                        return
                }
                imageCache.setObject(image, forKey: url as NSURL)
                if self.imageUrl == url {
                    self.setImage(image)
                }
        }
    }
}
