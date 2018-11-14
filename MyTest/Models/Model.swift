//
//  Model.swift
//  MyTest
//
//  Created by yura on 11/14/18.
//  Copyright © 2018 yura. All rights reserved.
//

import UIKit

class Model {

    private(set) var posts: [Hit] = [] {
        didSet {
            delegate?.dataUpdated()
        }
    }
    private(set) var page: Int = 1
    
    var title: String {
        return "Posts: \(self.posts.count)"
    }
    
    var lastPostIndex: Int {
        return posts.count - 1
    }
    
    weak var delegate: ModelDelegate?
    
    func getPosts() {
        GetDataTask<Hits>(request: GetPostsRequest(page: page)).execute { (response) in
            switch response {
            case .json(let data):
                let d = data as! Hits
                self.posts += d.hits
                self.page += 1
            case .error(_, let error):
                print(error?.localizedDescription ?? "none")
            }
        }
    }
    
}
