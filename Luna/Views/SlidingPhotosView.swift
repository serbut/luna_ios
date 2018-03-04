//
//  SlidingPhotosView.swift
//  Luna
//
//  Created by Sergey Butorin on 04/03/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit

class SlidingPhotosView: UICollectionView, UICollectionViewDelegateFlowLayout {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        delegate = self
        isPagingEnabled = true
        showsHorizontalScrollIndicator = false
        backgroundColor = UIColor.white
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
}
