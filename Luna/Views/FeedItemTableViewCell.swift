//
//  FeedItemTableViewCell.swift
//  Luna
//
//  Created by Sergey Butorin on 06/02/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit

class FeedItemTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var avatarLoadingActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoLoadingActivityIndicator: UIActivityIndicatorView!
    
    func setAvatar(_ avatar: UIImage?) {
        if let avatar = avatar {
            avatarLoadingActivityIndicator.stopAnimating()
            avatarImageView.isHidden = false
            avatarImageView.image = avatar
        } else {
            avatarLoadingActivityIndicator.startAnimating()
            avatarImageView.isHidden = true
        }
    }
    
    func setPhoto(_ photo: UIImage?) {
        if let photo = photo {
            photoLoadingActivityIndicator.stopAnimating()
            photoImageView.isHidden = false
            photoImageView.image = photo
        } else {
            photoLoadingActivityIndicator.startAnimating()
            photoImageView.isHidden = true
        }
    }
}
