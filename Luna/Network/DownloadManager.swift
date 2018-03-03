//
//  DownloadManager.swift
//  Luna
//
//  Created by Sergey Butorin on 07/02/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import Foundation
import Alamofire

class DownloadManager {
    static let shared = DownloadManager()

    func downloadImage(with url: URL, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 3.0, execute: {
        Alamofire.request(url)
            .responseData { response in
                guard let data = response.result.value,
                    let image = UIImage(data: data) else {
                        completion(nil)
                        return
                }
                completion(image)
        }
        })
    }
}
