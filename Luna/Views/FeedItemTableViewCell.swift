//
//  FeedItemTableViewCell.swift
//  Luna
//
//  Created by Sergey Butorin on 06/02/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit

class FeedItemTableViewCell: UITableViewCell {
    
    // MARK: - Views
    let headerView: FeedItemHeaderView = {
        let headerView = FeedItemHeaderView()
        return headerView
    }()
    
    let photoView: PhotoView = {
        let photoView = PhotoView(frame: .zero)
        photoView.contentMode = .scaleAspectFill
        photoView.clipsToBounds = true
        photoView.image = UIImage(named: "no_image")
        return photoView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    // MARK: - Variables
    var feedItem: FeedItem? {
        didSet {
            headerView.nameLabel.text = feedItem?.name
            headerView.addressLabel.text = feedItem?.address.description

        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(headerView)
        addSubview(photoView)
        addSubview(separatorView)

        addConstraints(withFormat: "H:|[v0]|", views: headerView)
        addConstraints(withFormat: "H:|[v0]|", views: photoView)
        addConstraints(withFormat: "V:|-16-[v0(80)]-8-[v1]-[v2(1)]|", views: headerView, photoView, separatorView)
    }

    func setAvatar(_ avatar: UIImage?) {
        headerView.avatarView.setImage(avatar)
    }
    
    func setPhoto(_ photo: UIImage?) {
        photoView.setImage(photo)
    }
}
