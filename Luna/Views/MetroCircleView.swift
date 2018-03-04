//
//  MetroCircleView.swift
//  Luna
//
//  Created by Sergey Butorin on 04/03/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit

class MetroCircleView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
    
}
