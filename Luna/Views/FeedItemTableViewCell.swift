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
        photoView.delegate = self
        photoView.register(SlidingPhotoViewCell.self, forCellWithReuseIdentifier: cellId)
        
        return photoView
    }()
    
    var pageControl = PageControl()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let priceLabel: PriceLabel = {
        let label = PriceLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Variables
    var feedItem: FeedItem? {
        didSet {
            if let item = feedItem {
                configureCell(withItem: item)
            }
        }
    }
    
    private func configureCell(withItem item: FeedItem) {
        headerView.nameLabel.text = item.name
        headerView.addressLabel.text = item.address.description
        priceLabel.text = "2 500 – 3 000 ₽"
        if let avatarPath = item.avatarPath {
            headerView.avatarView.downloadImage(withUrl: avatarPath)
        }
        let photosCount = item.photosPaths.count
        if photosCount > 1,
            let currentPhotoIndex = item.selectedPhotoIndex {
            pageControl.currentPage = currentPhotoIndex
            pageControl.numberOfPages = photosCount
            let indexPath = IndexPath(item: currentPhotoIndex, section: 0)
            slidingPhotoView.scrollToItem(at: indexPath, at: .bottom, animated: false)
        } else {
            pageControl.isHidden = true
        }
        slidingPhotoView.reloadData()
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
        addSubview(pageControl)
        addSubview(priceLabel)

        addConstraints(withFormat: "H:|[v0]|", views: headerView)
        addConstraints(withFormat: "H:|[v0]|", views: slidingPhotoView)
        addConstraints(withFormat: "H:|[v0]|", views: pageControl)
        addConstraints(withFormat: "V:|-16-[v0(40)]-16-[v1][v2]-8-[v3(1)]|", views: headerView, slidingPhotoView, pageControl, separatorView)
        addConstraints(withFormat: "H:|-16-[v0]", views: priceLabel)
        addConstraint(NSLayoutConstraint(item: priceLabel, attribute: .top, relatedBy: .equal, toItem: slidingPhotoView, attribute: .top, multiplier: 1, constant: 18))
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

extension FeedItemTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.isSelected = true
//    }
//    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: slidingPhotoView.frame.width, height: slidingPhotoView.frame.height)
    }
}
