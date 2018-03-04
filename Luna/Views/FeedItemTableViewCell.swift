//
//  FeedItemTableViewCell.swift
//  Luna
//
//  Created by Sergey Butorin on 06/02/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit

class FeedItemTableViewCell: UITableViewCell {
    
    let cellId = "PhotoCell"
    
    // MARK: - Views
    let headerView: FeedItemHeaderView = {
        let headerView = FeedItemHeaderView()
        return headerView
    }()

    lazy var slidingPhotoView: SlidingPhotosView = {
        let layout = UICollectionViewFlowLayout()
        let photoView = SlidingPhotosView(frame: .zero, collectionViewLayout: layout)

        photoView.dataSource = self
        photoView.allowsSelection = false
        photoView.register(SlidingPhotoViewCell.self, forCellWithReuseIdentifier: cellId)
        
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
            if let avatarPath = feedItem?.avatarPath {
                headerView.avatarView.downloadImage(withUrl: avatarPath)
            }
            slidingPhotoView.reloadData()
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
        addSubview(slidingPhotoView)
        addSubview(separatorView)

        addConstraints(withFormat: "H:|[v0]|", views: headerView)
        addConstraints(withFormat: "H:|[v0]|", views: slidingPhotoView)
        addConstraints(withFormat: "V:|-16-[v0(80)]-8-[v1]-[v2(1)]|", views: headerView, slidingPhotoView, separatorView)
    }
}

extension FeedItemTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let photosCount = feedItem?.photosPaths.count,
            photosCount > 1 {
            return photosCount
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SlidingPhotoViewCell
        if let photosCount = feedItem?.photosPaths.count,
            photosCount > indexPath.item,
            let photoPath = feedItem?.photosPaths[indexPath.item] {
            cell.photoView.downloadImage(withUrl: photoPath)
        }
        return cell
    }
}
