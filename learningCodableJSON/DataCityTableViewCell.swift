//
//  DataCityTableViewCell.swift
//  learningCodableJSON
//
//  Created by Larissa Diniz  on 11/02/20.
//  Copyright © 2020 Larissa Diniz . All rights reserved.
//

import UIKit

class DataCityTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var nameCityLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var valueHumidityLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var valueMinLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var valueMaxLabel: UILabel!

    func setLabels(city: Weather) {
        nameCityLabel.text = city.city
        valueHumidityLabel.text = "\(city.humidity)"
        valueMinLabel.text = "\(city.min)"
        valueMaxLabel.text = "\(city.max)"
    }
}
