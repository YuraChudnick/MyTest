//
//  DataSource.swift
//  MyTest
//
//  Created by yura on 11/14/18.
//  Copyright © 2018 yura. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource {
    
    private let dataModel: Model
    
    init(model: Model) {
        self.dataModel = model
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
        let post = dataModel.posts[indexPath.row]
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.created_at != nil ? post.created_at!.convertToString() : nil
        return cell
    }
    
}
