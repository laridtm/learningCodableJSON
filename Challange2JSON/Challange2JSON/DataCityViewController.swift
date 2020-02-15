//
//  DataCityViewController.swift
//  Challange2JSON
//
//  Created by Larissa Diniz  on 14/02/20.
//  Copyright © 2020 Larissa Diniz . All rights reserved.
//

import UIKit

class DataCityViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var climateLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    
    var selectedCity: City?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let currentCity = selectedCity else {
            return
        }

        cityLabel.text = name
        humidityLabel.text = "\(currentCity.humidity)%"
        climateLabel.text = currentCity.climate
        tempMaxLabel.text = "\(currentCity.temperature[0].max)º"
        tempMinLabel.text = "\(currentCity.temperature[0].min)º"
        
    }
    

}
