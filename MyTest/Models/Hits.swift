//
//  Hits.swift
//  MyTest
//
//  Created by yura on 16.09.2018.
//  Copyright © 2018 yura. All rights reserved.
//

import ObjectMapper

struct Hits: Mappable {
    
    var hits: [Hit] = []
    var page: Int?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        hits          <-    map["hits"]
        page          <-    map["page"]
    }
    
}
