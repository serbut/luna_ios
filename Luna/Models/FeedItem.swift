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
    let avatar: Photo?
    var photos: [Photo]
    let stars: Double
    
    init(from graphQLFeedItem: FeedQuery.Data.Feed) {
        self.id = graphQLFeedItem.id
        self.name = graphQLFeedItem.name
        self.address = graphQLFeedItem.address.description
        self.avatar = Photo(path: graphQLFeedItem.avatar.path)
        self.photos = [Photo]()
        for photoUrl in graphQLFeedItem.photos {
            self.photos.append(Photo(path: photoUrl.path)!)
        }
        self.stars = graphQLFeedItem.stars
    }
}
