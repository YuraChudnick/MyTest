//
//  Operation.swift
//  MyTest
//
//  Created by yura on 16.09.2018.
//  Copyright © 2018 yura. All rights reserved.
//

import Foundation

protocol Operation {
    
    var request: Request { get }
    
    func execute(completitionHandler: @escaping (Response) -> Void)
    
}
