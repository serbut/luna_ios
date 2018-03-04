//
//  PageControl.swift
//  Luna
//
//  Created by Sergey Butorin on 04/03/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit

class PageControl: UIPageControl {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        pageIndicatorTintColor = UIColor.mainColor.withAlphaComponent(0.5)
        currentPageIndicatorTintColor = UIColor.mainColor
    }

}
