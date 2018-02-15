//
//  FeedItemTableViewCell.swift
//  Luna
//
//  Created by Sergey Butorin on 06/02/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit

class FeedItemTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarView: LPhotoView!
    @IBOutlet weak var photoView: LPhotoView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!

    func setAvatar(_ avatar: UIImage?) {
        avatarView.setImage(avatar)
    }
    
    func setPhoto(_ photo: UIImage?) {
        photoView.setImage(photo)
    }
}
