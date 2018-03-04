//
//  FeedItemHeaderView.swift
//  Luna
//
//  Created by Sergey Butorin on 03/03/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit

class FeedItemHeaderView: UIView {

    let avatarView: PhotoView = {
        let photoView = PhotoView(frame: .zero)
        photoView.contentMode = .scaleAspectFill
        photoView.clipsToBounds = true
        photoView.image = UIImage(named: "no_avatar")
        photoView.layer.cornerRadius = 22
        return photoView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func setupViews() {
        addSubview(avatarView)
        addSubview(nameLabel)
        addSubview(addressLabel)
        
        addConstraints(withFormat: "H:|-16-[v0(44)]-8-[v1]-16-|", views: avatarView, nameLabel)
        addConstraints(withFormat: "V:|-16-[v0]-16-|", views: avatarView)
        addConstraints(withFormat: "V:|-16-[v0(20)]-8-[v1(20)]-16-|", views: nameLabel, addressLabel)
        
        addConstraint(NSLayoutConstraint(item: addressLabel, attribute: .width, relatedBy: .equal, toItem: nameLabel, attribute: .width, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: addressLabel, attribute: .centerX, relatedBy: .equal, toItem: nameLabel, attribute: .centerX, multiplier: 1, constant: 0))
    }

}
