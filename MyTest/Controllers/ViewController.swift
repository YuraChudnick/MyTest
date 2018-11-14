//
//  ViewController.swift
//  MyTest
//
//  Created by yura on 16.09.2018.
//  Copyright © 2018 yura. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ModelDelegate, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let model = Model()
    lazy var dataSource: DataSource = {
        return DataSource(model: self.model)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = dataSource
        
        model.delegate = self
        model.getPosts()
        
        title = model.title
    }
    
    func dataUpdated() {
        title = model.title
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == model.lastPostIndex {
            let activityIndicator = UIActivityIndicatorView(style: .gray)
            activityIndicator.startAnimating()
            activityIndicator.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 44)
            
            self.tableView.tableFooterView = activityIndicator
            self.tableView.tableFooterView?.isHidden = false
            model.getPosts()
        }
    }
    
}
