//
//  SlidingPhotoViewCell.swift
//  Luna
//
//  Created by Sergey Butorin on 04/03/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit

class SlidingPhotoViewCell: UICollectionViewCell {
    var photoView: PhotoView
    
    override init(frame: CGRect) {
        photoView = PhotoView(frame: .zero)
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        photoView = PhotoView(frame: .zero)
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        addSubview(photoView)
        photoView.contentMode = .scaleAspectFill
        photoView.clipsToBounds = true
        photoView.image = UIImage(named: "no_image")
        addConstraints(withFormat: "H:|[v0]|", views: photoView)
        addConstraints(withFormat: "V:|[v0]|", views: photoView)
    }
}
