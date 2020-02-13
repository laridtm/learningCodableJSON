//
//  DataCityTableViewCell.swift
//  learningCodableJSON
//
//  Created by Larissa Diniz  on 11/02/20.
//  Copyright © 2020 Larissa Diniz . All rights reserved.
//

import UIKit

class DataCity: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var nameCityLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var valueHumidityLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var valueMinLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var valueMaxLabel: UILabel!
    
    
    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameCityLabel.text = weather?.city
        valueHumidityLabel.text = "\(weather?.humidity)%"
        valueMinLabel.text = "\(weather?.min)º"
        valueMaxLabel.text = "\(weather?.max)º"
    }
}