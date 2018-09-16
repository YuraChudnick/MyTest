//
//  ViewController.swift
//  MyTest
//
//  Created by yura on 16.09.2018.
//  Copyright © 2018 yura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var posts: [Hit] = []
    
    var page: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getPosts()
    }

    func getPosts() {
        GetDataTask<Hits>(request: GetPostsRequest(page: page)).execute { (response) in
            switch response {
            case .json(let data):
                let d = data as! Hits
                self.posts += d.hits
                self.title = "Posts: \(self.posts.count)"
                self.tableView.reloadData()
            case .error(_, let error):
                print(error?.localizedDescription ?? "none")
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
        let post = posts[indexPath.row]
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.created_at != nil ? post.created_at!.convertToString() : nil
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = posts.count - 1
        if indexPath.row == lastItem {
            page += 1
            getPosts()
        }
    }
    
}
