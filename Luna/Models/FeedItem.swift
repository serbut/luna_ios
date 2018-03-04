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
    let address: String
    let avatarPath: URL?
    var photosPaths: [URL]
    let stars: Double
    var selectedPhotoIndex: Int?
    
    init(from graphQLFeedItem: FeedQuery.Data.Feed) {
        self.id = graphQLFeedItem.id
        self.name = graphQLFeedItem.name
        self.address = graphQLFeedItem.address.description
        self.avatarPath = URL(string: graphQLFeedItem.avatar.path)
        self.photosPaths = graphQLFeedItem.photos.flatMap { URL(string: $0.path) }
        if !photosPaths.isEmpty {
            selectedPhotoIndex = 0
        }
        self.stars = graphQLFeedItem.stars
    }
}
