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
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let metroView: MetroCircleView = {
        let view = MetroCircleView()
        view.backgroundColor = UIColor.darkGray
        return view
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
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
        addSubview(metroView)
        addSubview(addressLabel)
        
        addConstraints(withFormat: "H:|-16-[v0(40)]-8-[v1]-16-|", views: avatarView, nameLabel)
        addConstraints(withFormat: "V:|[v0]|", views: avatarView)
        addConstraints(withFormat: "V:|[v0(20)][v1(20)]|", views: nameLabel, addressLabel)
        addConstraints(withFormat: "H:[v0(8)]-4-[v1]", views: metroView, addressLabel)
        
        addConstraint(NSLayoutConstraint(item: metroView, attribute: .left, relatedBy: .equal, toItem: nameLabel, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: metroView, attribute: .centerY, relatedBy: .equal, toItem: addressLabel, attribute: .centerY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: metroView, attribute: .height, relatedBy: .equal, toItem: metroView, attribute: .width, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: addressLabel, attribute: .left, relatedBy: .equal, toItem: metroView, attribute: .right, multiplier: 1, constant: 4))
        addConstraint(NSLayoutConstraint(item: addressLabel, attribute: .right, relatedBy: .equal, toItem: nameLabel, attribute: .right, multiplier: 1, constant: 0))  
    }
}
