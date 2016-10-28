//
//  FeedEnclosure.swift
//
//  Created by illyabbi 20161021.
//  Copyright (c) 2016 illyabbi. All rights reserved.
//

import UIKit

class FeedEnclosure: NSObject {
    var url: String
    var type: String
    var length: Int
    
    init(url: String, type: String, length: Int) {
        self.url = url
        self.type = type
        self.length = length
    }
}
