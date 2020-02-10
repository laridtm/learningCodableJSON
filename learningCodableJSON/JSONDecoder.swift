//
//  JSONDecoder.swift
//  learningCodableJSON
//
//  Created by Larissa Diniz  on 10/02/20.
//  Copyright © 2020 Larissa Diniz . All rights reserved.
//

import Foundation

struct Weather: Codable {
    
    var humidity: Int
    var city: String
    var min: Int
    var max: Int
    
}

let json = """
{
"humidity": 67,
"city": "Flonopx",
"min": 20,
"max": 26
}
""".data(using: .utf8)!

let decoder = JSONDecoder()
let howWeather = try! decoder.decode(Weather.self, from: json)



