//
//  FeedItem.swift
//  Luna
//
//  Created by Sergey Butorin on 07/02/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import Foundation
import Apollo

struct FeedItem {
    let id: String
    let name: String
    let address: Address
    let avatarPath: URL?
    var photosPaths: [URL]
    let stars: Double
    var selectedPhotoIndex: Int?
    
    init(with graphQLFeedItem: FeedQuery.Data.Feed) {
        self.id = graphQLFeedItem.id
        self.name = graphQLFeedItem.name
        self.address = Address(with: graphQLFeedItem.address)
        self.avatarPath = URL(string: graphQLFeedItem.avatar?.path ?? "")
        self.photosPaths = graphQLFeedItem.photos.flatMap { URL(string: $0.path) }
        if !photosPaths.isEmpty {
            selectedPhotoIndex = 0
        }
        self.stars = graphQLFeedItem.stars
    }
}
