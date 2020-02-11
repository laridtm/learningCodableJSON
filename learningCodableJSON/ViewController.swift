//
//  ViewController.swift
//  learningCodableJSON
//
//  Created by Larissa Diniz  on 10/02/20.
//  Copyright © 2020 Larissa Diniz . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cities: [City] = [City(name: "Florianópolis"),
                        City(name: "Palhoça"),
                        City(name: "São José"),
                        City(name: "Santo Amaro")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Humidity in \(howWeather.city) is \(howWeather.humidity)")
        
        print(cities)
    }


}

