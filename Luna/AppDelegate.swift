//
//  AppDelegate.swift
//  Luna
//
//  Created by Sergey Butorin on 25/01/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit
import CoreData
import Apollo

let apiUrl = "https://utrobin.com/api/"
let graphQlUrl = apiUrl + "graphql"
let apollo = ApolloClient(url: URL(string: graphQlUrl)!)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        window?.rootViewController = FeedViewController()
        
        return true
    }
}

