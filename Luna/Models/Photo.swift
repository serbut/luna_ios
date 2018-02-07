//
//  Photo.swift
//  Luna
//
//  Created by Sergey Butorin on 07/02/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import Foundation
import UIKit

class Photo {
    let path: URL
    var image: UIImage?
    
    init?(path: String) {
        guard let url = URL(string: path) else {
            return nil
        }
        self.path = url
        DownloadManager.shared.downloadImage(with: url) {
            self.image = $0
        }
    }
}
