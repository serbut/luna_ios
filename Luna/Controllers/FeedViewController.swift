//
//  FeedViewController.swift
//  Luna
//
//  Created by Sergey Butorin on 25/01/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    let cellId = "FeedItem"

    // MARK: - Views
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        tv.register(FeedItemTableViewCell.self, forCellReuseIdentifier: cellId)
        return tv
    }()
    
    let footerActivityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = UIColor.gray
        return activityIndicator
    }()
    
    let initialLoadingActivityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        activityIndicator.color = UIColor.gray
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    // MARK: - Variables
    fileprivate var feedItems = [FeedItem]() {
        didSet {
            DispatchQueue.main.async {
                self.initialLoadingActivityIndicator.stopAnimating()
            }
        }
    }
        
    fileprivate let loadLimit = 10
    fileprivate var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupViews()
        loadNextPage()
    }
    
    func setupViews() {        
        view.addSubview(tableView)
        view.addSubview(initialLoadingActivityIndicator)
        
        view.addConstraints(withFormat: "H:|[v0]|", views: tableView)
        view.addConstraints(withFormat: "V:|[v0]|", views: tableView)
        
        view.addConstraints(withFormat: "H:|[v0]|", views: initialLoadingActivityIndicator)
        view.addConstraints(withFormat: "V:|[v0]|", views: initialLoadingActivityIndicator)
    }
}

// MARK: - Table View Data Source
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! FeedItemTableViewCell
        
        cell.feedItem = feedItems[indexPath.item]
        
        return cell
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
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.white
        self.navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerActivityIndicator
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 80
    }
}
