//
//  GetPostsRequest.swift
//  MyTest
//
//  Created by yura on 16.09.2018.
//  Copyright © 2018 yura. All rights reserved.
//

import Alamofire

struct GetPostsRequest: Request {
    
    var baseUrl: String {
        return "https://hn.algolia.com/"
    }
    
    var path: String {
        return "/api/v1/search_by_date"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: [String : Any]
    
    init(page: Int) {
        self.parameters = ["tags": "story",
                           "page": page]
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try baseUrl.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(20)
        return try URLEncoding.default.encode(request, with: parameters)
    }
    
    
}
