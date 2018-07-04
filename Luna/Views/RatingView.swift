//
//  RatingView.swift
//  Luna
//
//  Created by Sergey Butorin on 05/03/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit

class RatingView: UIStackView {
    
    let fullStarImage = UIImage(named: "full_star")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.axis = .horizontal
    }
    
    func show(rating: Int) {
        self.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for _ in 0..<rating {
            let starView = UIImageView(image: fullStarImage)
            
            starView.heightAnchor.constraint(equalTo: starView.widthAnchor, multiplier: 1).isActive = true
            addArrangedSubview(starView)
        }
    }
}
