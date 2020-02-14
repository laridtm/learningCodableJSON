//
//  City.swift
//  Challange2JSON
//
//  Created by Larissa Diniz  on 14/02/20.
//  Copyright © 2020 Larissa Diniz . All rights reserved.
//

import Foundation

struct City: Codable {
    
    var humidity: Int
    var climate: String
    var temperature: [Temperature]
    
}
