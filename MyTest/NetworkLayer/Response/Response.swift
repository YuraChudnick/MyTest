//
//  Response.swift
//  MyTest
//
//  Created by yura on 16.09.2018.
//  Copyright © 2018 yura. All rights reserved.
//

import Foundation

public enum Response {
    
    case json(_: Any)
    case error(_: Int?, _: Error?)
    
    init(_ response: (r: HTTPURLResponse?, data: Any?, error: Error?)) {
        
        guard response.r?.statusCode == 200, response.error == nil else {
            self = .error(response.r?.statusCode, response.error)
            return
        }
        
        guard let d = response.data else {
            self = .error(response.r?.statusCode, response.error)
            return
        }
        
        self = .json(d)
    }
    
}
