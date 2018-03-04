//
//  PriceLabel.swift
//  Luna
//
//  Created by Sergey Butorin on 04/03/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit

class PriceLabel: UILabel {
    
    let padding = UIEdgeInsets(top: 4, left: 12, bottom: 4, right: 12)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        backgroundColor = UIColor.mainColor.withAlphaComponent(0.7)
        textColor = UIColor.white
        layer.masksToBounds = true
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, padding))
        layer.cornerRadius = frame.height / 2
    }
    
    override var intrinsicContentSize: CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.left + padding.right
        let heigth = superContentSize.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }
}
