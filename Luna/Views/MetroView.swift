//
//  MetroView.swift
//  Luna
//
//  Created by Sergey Butorin on 05/03/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit

class MetroView: UIView {
    
    let circleView = MetroCircleView()
    let stationLabel = LunaLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        addSubview(circleView)
        addSubview(stationLabel)
                
        addConstraints(withFormat: "H:|[v0(8)]-4-[v1]|", views: circleView, stationLabel)
        addConstraints(withFormat: "V:[v0(8)]", views: circleView)
        addConstraints(withFormat: "V:|[v0]|", views: stationLabel)
        
         addConstraint(NSLayoutConstraint(item: circleView, attribute: .centerY, relatedBy: .equal, toItem: stationLabel, attribute: .centerY, multiplier: 1, constant: 0))
    }
}
