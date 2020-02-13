//
//  ViewController.swift
//  learningCodableJSON
//
//  Created by Larissa Diniz  on 10/02/20.
//  Copyright © 2020 Larissa Diniz . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    var weatherArr: DicWeather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        do {
           weatherArr = try decoder.decode(DicWeather.self, from: json)
           print(weatherArr?.weather)
       } catch {
           print(error)
       }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArr!.weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell") as? CityTableViewCell
        
        cell?.setCity(city: weatherArr!.weather[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
    }
}

