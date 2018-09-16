//
//  Date+Extension.swift
//  MyTest
//
//  Created by yura on 16.09.2018.
//  Copyright © 2018 yura. All rights reserved.
//

import UIKit

extension Date {
    
    func convertToString(dateFormat: String = "MMM d, h:mm a") -> String {
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = tempLocale
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
}
