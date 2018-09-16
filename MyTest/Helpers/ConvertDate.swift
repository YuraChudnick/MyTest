//
//  ConvertDate.swift
//  MyTest
//
//  Created by yura on 16.09.2018.
//  Copyright © 2018 yura. All rights reserved.
//

import Foundation
import ObjectMapper

class ConvertDate: TransformType {
    typealias Object = Date
    typealias JSON = String
    
    func transformFromJSON(_ value: Any?) -> Date? {
        if let timeStr = value as? String {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
            return dateFormatter.date(from: timeStr)
        }
        
        return nil
    }
    
    func transformToJSON(_ value: Date?) -> String? {
        return nil
    }
    
}
