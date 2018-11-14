//
//  Hit.swift
//  MyTest
//
//  Created by yura on 16.09.2018.
//  Copyright © 2018 yura. All rights reserved.
//

import ObjectMapper

struct Hit: Mappable {
    
    var created_at: Date?
    var title: String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        created_at     <-    (map["created_at"], ConvertDate())
        title          <-    map["title"]
    }
    
    
}
