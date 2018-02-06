//
//  ViewController.swift
//  Luna
//
//  Created by Sergey Butorin on 25/01/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    let rowHeight: CGFloat = 350
    
    var feedItems: [FeedItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let allFeedQuery = AllFeedQuery(limit: 10, offset: 0)
        apollo.fetch(query: allFeedQuery) { [weak self] result, error in
            guard let feedItems = result?.data?.feed else { return }
            self?.feedItems = feedItems.map { $0.fragments.feedItem }
        }
    }

    
}

// MARK: - Table View Data Source
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedItem") as! FeedItemTableViewCell
        
        let itemForCell = feedItems[indexPath.row]
        
        cell.nameLabel.text = itemForCell.name
        cell.addressLabel.text = "Stars: \(itemForCell.stars)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
}

// MARK: - Table View Delegate
extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
