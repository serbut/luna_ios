//
//  Address.swift
//  Luna
//
//  Created by Sergey Butorin on 05/03/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit

struct Address {
    let metroStations: [MetroStation]
    let details: String
    let coordinates: Coordinates
    var nearestStation: MetroStation? {
        return metroStations.sorted{ $0.distance < $1.distance }.first
    }
    
    init(with graphQLAddress: FeedQuery.Data.Feed.Address) {
        self.details = graphQLAddress.description
        self.metroStations = graphQLAddress.stations.map { MetroStation(with: $0) }
        self.coordinates = Coordinates(lat: graphQLAddress.lat,
                                       long: graphQLAddress.lon)
    }
}

struct MetroStation {
    let name: String
    let lineName: String
    let lineColor: UIColor
    let distance: Double
    
    init(with graphQLStation: FeedQuery.Data.Feed.Address.Station) {
        self.name = graphQLStation.name
        self.lineName = graphQLStation.line
        self.lineColor = UIColor(hexString: graphQLStation.color)
        self.distance = graphQLStation.distance
    }
}

struct Coordinates {
    let lat: Double
    let long: Double
}
