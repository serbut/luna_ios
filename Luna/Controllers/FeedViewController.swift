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
    @IBOutlet weak var footerActivityIndicator: UIActivityIndicatorView!
    
    // MARK: - Variables
    let rowHeight: CGFloat = 350
    
    var feedItems: [FeedItem] = []
    
    let loadLimit = 10
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        loadFeed(page: currentPage)
    }

    func loadFeed(page: Int) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let limit = 10
        let allFeedQuery = FeedQuery(limit: limit, offset: (page - 1) * limit)
        apollo.fetch(query: allFeedQuery) { [unowned self] result, error in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            self.footerActivityIndicator.stopAnimating()
            
            guard let graphQLFeedItems = result?.data?.feed else { return }
            
            if (!graphQLFeedItems.isEmpty) {
                DispatchQueue.global(qos: .userInitiated).async {
                    let newItems = graphQLFeedItems.map { FeedItem(from: $0) }
                    let indexPaths = newItems.indices.map { IndexPath(row: $0 + self.feedItems.count, section: 0) }
                    self.feedItems.append(contentsOf: newItems)
                    DispatchQueue.main.async {
                        self.tableView.beginUpdates()
                        self.tableView.insertRows(at: indexPaths, with: .automatic)
                        self.tableView.endUpdates()
                    }
                }
            }
        }
        currentPage += 1
    }
    
    
}

// MARK: - Table View Data Source
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedItem") as! FeedItemTableViewCell
        
        configureCell(cell: cell, forItemIndex: indexPath.row)
        
        return cell
    }
    
    private func configureCell(cell: FeedItemTableViewCell, forItemIndex itemIndex: Int) {
        let itemForCell = feedItems[itemIndex]
        
        cell.nameLabel.text = "\(itemIndex) \(itemForCell.name)"
        cell.addressLabel.text = itemForCell.address.description
        
        if let avatar = itemForCell.avatar {
            cell.setAvatar(avatar.image)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row == feedItems.count - 1) {
            loadFeed(page: currentPage)
        }
    }
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        footerActivityIndicator.startAnimating()
    }
}

// MARK: - Table View Delegate
extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
