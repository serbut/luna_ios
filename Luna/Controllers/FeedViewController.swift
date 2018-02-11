//
//  FeedViewController.swift
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
    @IBOutlet weak var initialLoadingActivitiIndicator: UIActivityIndicatorView!
    
    // MARK: - Variables
    var feedItems = [FeedItem]() {
        didSet {
            DispatchQueue.main.async {
                self.initialLoadingActivitiIndicator.stopAnimating()
            }
        }
    }
    
    let loadLimit = 10
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        loadNextPage()
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
        if let photo = itemForCell.photos.first {
            cell.setPhoto(photo.image)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row == feedItems.count - 1) {
            loadNextPage()
        }
    }
    
    private func loadNextPage() {
        if (!feedItems.isEmpty) {
            footerActivityIndicator.startAnimating()
        }
        FeedManager.shared.loadFeed(page: currentPage) { items in
            self.footerActivityIndicator.stopAnimating()
            
            if (!items.isEmpty) {
                DispatchQueue.global(qos: .userInitiated).async {
                    let newItems = items.map { FeedItem(from: $0) }
                    let indexPaths = newItems.indices.map { IndexPath(row: $0 + self.feedItems.count, section: 0) }
                    self.feedItems.append(contentsOf: newItems)
                    DispatchQueue.main.async {
                        self.tableView.beginUpdates()
                        self.tableView.insertRows(at: indexPaths, with: .none)
                        self.tableView.endUpdates()
                    }
                }
            }
        }
        currentPage += 1
    }
}

// MARK: - Table View Delegate
extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
