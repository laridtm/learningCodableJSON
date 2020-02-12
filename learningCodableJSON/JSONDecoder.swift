//
//  JSONDecoder.swift
//  learningCodableJSON
//
//  Created by Larissa Diniz  on 10/02/20.
//  Copyright © 2020 Larissa Diniz . All rights reserved.
//

import Foundation

struct Weather: Codable {
    
    let humidity: Int
    let city: String
    let min: Int
    let max: Int
    
}

struct DicWeather: Codable {
    
    let weather: [Weather]
}

func getJSON() {
    let json = """
    {
     "weather": [
        {
          "humidity": 67,
          "city": "Flonopx",
          "min": 21,
          "max": 26
        },
        {
          "humidity": 57,
          "city": "Palhoça",
          "min": 20,
          "max": 26
        }
      ]
    }
    """.data(using: .utf8)!

    let decoder = JSONDecoder()
    var arrWeather: DicWeather?
    
    do {
        arrWeather = try decoder.decode(DicWeather.self, from: json)
        print(arrWeather?.weather)
    } catch {
        print(error)
    }
}


