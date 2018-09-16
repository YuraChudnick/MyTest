//
//  GetDataTask.swift
//  MyTest
//
//  Created by yura on 16.09.2018.
//  Copyright © 2018 yura. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GetDataTask<T: Mappable>: Operation {
    
    var request: Request
    
    init(request: Request) {
        self.request = request
    }
    
    func execute(completitionHandler: @escaping (Response) -> Void) {
        Alamofire.request(request).responseObject { (response: DataResponse<T>) in
            completitionHandler(.init((r: response.response, data: response.result.value, error: response.result.error)))
        }
    }
    
}
