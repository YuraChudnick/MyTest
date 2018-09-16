//
//  Request.swift
//  MyTest
//
//  Created by yura on 16.09.2018.
//  Copyright © 2018 yura. All rights reserved.
//

import Alamofire

public protocol Request: URLRequestConvertible {
    
    var baseUrl: String { get }
    
    var path: String { get }
    
    var method: HTTPMethod { get }
    
    var parameters: [String: Any] { get }
    
}
