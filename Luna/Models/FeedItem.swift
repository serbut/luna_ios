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
    var photosPath: [URL]
    let stars: Double
    
    init(from graphQLFeedItem: FeedQuery.Data.Feed) {
        self.id = graphQLFeedItem.id
        self.name = graphQLFeedItem.name
        self.address = graphQLFeedItem.address.description
        self.avatarPath = URL(string: graphQLFeedItem.avatar.path)
        self.photosPath = graphQLFeedItem.photos.flatMap { URL(string: $0.path) }
        self.stars = graphQLFeedItem.stars
    }
}
