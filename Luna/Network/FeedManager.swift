//
//  FeedManager.swift
//  Luna
//
//  Created by Sergey Butorin on 07/02/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import Foundation
import Apollo

class FeedManager {
    static let shared = FeedManager()
    
    func loadFeed(page: Int, completion: @escaping ([FeedQuery.Data.Feed]) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let limit = 10
        let allFeedQuery = FeedQuery(limit: limit, offset: (page - 1) * limit)
        apollo.fetch(query: allFeedQuery) { result, error in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            guard let graphQLFeedItems = result?.data?.feed else { return }
            
            completion(graphQLFeedItems)
        }
    }
}
