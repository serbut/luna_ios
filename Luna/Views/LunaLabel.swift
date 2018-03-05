//
//  LunaLabel.swift
//  Luna
//
//  Created by Sergey Butorin on 05/03/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit

class LunaLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        font = UIFont.systemFont(ofSize: 14)
    }
}
