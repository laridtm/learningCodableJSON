//
//  Weather.swift
//  learningCodableJSON
//
//  Created by Larissa Diniz  on 13/02/20.
//  Copyright © 2020 Larissa Diniz . All rights reserved.
//

import Foundation

struct Weather: Codable {
    
    let humidity: Int
    let city: String
    let min: Int
    let max: Int
    
}
